import Combine
import GameplayKit

/// Conform to this protocol in order to publish `GKState` changes.
public protocol StatePublishing {

    /// Publisher for recently changed `GKState`s.
    var publishedState: PassthroughSubject<GKState, Never> { get }
}
