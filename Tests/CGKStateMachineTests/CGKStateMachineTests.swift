import Combine
import GameplayKit
import XCTest
@testable import CGKStateMachine

final class CGKStateMachineTests: XCTestCase {

    class FirstState: CGKState {}
    class SecondState: CGKState {}

    var cgkStateMachine: CGKStateMachine = {
        CGKStateMachine(
            states: [
                FirstState(),
                SecondState()
            ]
        )
    }()

    var cancellables = Set<AnyCancellable>()

    func testStateTransition() throws {
        XCTAssertNil(cgkStateMachine.currentState)

        cgkStateMachine.enter(FirstState.self)
        var currentState = try XCTUnwrap(cgkStateMachine.currentState)
        XCTAssertTrue(currentState.self is FirstState)

        cgkStateMachine.enter(SecondState.self)
        currentState = try XCTUnwrap(cgkStateMachine.currentState)
        XCTAssertTrue(currentState.self is SecondState)
    }

    func testPublishedStates() throws {
        var publishedStates: [GKState] = []
        cgkStateMachine.publishedState
            .sink { state in
                publishedStates.append(state)
            }
            .store(in: &cancellables)

        cgkStateMachine.enter(FirstState.self)
        cgkStateMachine.enter(SecondState.self)
        cgkStateMachine.enter(FirstState.self)

        let publishedStatesExpectation = XCTestExpectation()
        if publishedStates[0] is FirstState,
           publishedStates[1] is SecondState,
           publishedStates[2] is FirstState {
            publishedStatesExpectation.fulfill()
        } else {
            XCTFail("Expected states weren't published")
        }

        wait(for: [publishedStatesExpectation], timeout: 10)
    }
}
