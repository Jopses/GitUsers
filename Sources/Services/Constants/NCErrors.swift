import Foundation

enum NCErrors: Error, LocalizedError {
    case failedData

    var errorDescription: String? {
        return localizedDescription
    }

    var localizedDescription: String {
        switch self {
        case .failedData:
            return "Get failed data"
        }
    }
}
