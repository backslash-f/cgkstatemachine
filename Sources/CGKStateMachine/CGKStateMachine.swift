import Combine
import GameplayKit

/// A custom `GKStateMachine` that publishes `GKState` changes.
public class CGKStateMachine: GKStateMachine, StatePublishing {
    
    // MARK: - Public Properties

    /// Subscribe to this publisher to keep track of `GKState` changes.
    ///
    /// The published state value matches the value of `-[GKStateMachine currentState]`.
    public let publishedState = PassthroughSubject<GKState, Never>()

    // MARK: Internal Properties

    /// Enables / disables logging output to both *Xcode's Console* and the macOS *Console app*. `true` by default.
    internal static var isLoggingEnabled: Bool = true
    
    // MARK: - Lifecyce

    /// Calls `GKStateMachine.init(states:)` passing in the given array of `CGKState`.
    ///
    /// - Parameter states: and array of states of `CGKState` type.
    public init(states: [CGKState]) {
        super.init(states: states)
    }
    
    @available(*, unavailable)
    override private init(states: [GKState]) {
        let errorMessage = """
            init(states: [GKState]) has not been implemented.
            Use init(states: [CGKState]) instead.
        """
        fatalError(errorMessage)
    }
}
