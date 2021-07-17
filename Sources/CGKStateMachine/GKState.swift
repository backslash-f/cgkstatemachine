import GameplayKit

/// Custom `GKState` subclass that publishes state changes.
///
/// Publishing is possible when its `stateMachine` property is of `CGKStateMachine` type.
public class CGKState: GKState {

    public override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        publishState()
    }
}

// MARK: - Private

private extension CGKState {

    /// Sends the entered state to the `CGKStateMachine.getter:publishedState` publisher.
    func publishState() {
        let currentState = String(describing: stateMachine?.currentState)
        CGKStateMachine.log("Did enter state: \(currentState)", category: .lifecycle)
        (stateMachine as? CGKStateMachine)?.publishedState.send(self)
    }
}
