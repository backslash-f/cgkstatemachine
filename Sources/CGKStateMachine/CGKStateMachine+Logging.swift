import AppLogger
import Foundation

/// `CGKStateMachine` logging categories to further distinguish the running parts of the package.
///
/// Refer to: https://developer.apple.com/documentation/os/logging
public enum CGKStateMachineLoggingCategory: String {
    case error      = "CGKStateMachine_Error"
    case lifecycle  = "CGKStateMachine_Lifecycle"
}

// MARK: - Interface

public extension CGKStateMachine {

    // MARK: Enable / Disable Logging

    /// Enables logging information via `AppLogger`.
    ///
    /// When logging is enabled, the output will be available in *Xcode's Console* or
    /// in the *macOS Console app*.
    ///
    /// In the **macOS Console app**, you can filter CGKStateMachine's output by
    /// `SUBSYSTEM`: `com.backslash-f.CGKStateMachine`.
    func enableLogging() {
        CGKStateMachine.isLoggingEnabled = true
    }

    /// Disables logging information via `AppLogger`.
    func disableLogging() {
        CGKStateMachine.isLoggingEnabled = false
    }
}

// MARK: - Internal

internal extension CGKStateMachine {

    /// Logs the given `String` information via `AppLogger`.
    ///
    /// - Parameters:
    ///   - string: The `String` to be logged.
    ///   - category: A member of the `CGKStateMachineLoggingCategory` enum.
    static func log(_ string: String, category: CGKStateMachineLoggingCategory) {
        guard isLoggingEnabled else {
            return
        }
        let subsystem = "com.backslash-f.CGKStateMachine"
        let logger = AppLogger(subsystem: subsystem, category: category.rawValue)
        logger.log(string)
    }

    static func logError(_ error: String) {
        log(error, category: .error)
    }
}
