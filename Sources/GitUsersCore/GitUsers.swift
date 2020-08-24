import Foundation
import Services


public final class GitUsers {
    public init() {}

    public func run() throws {
        requestUsername()
        dispatchMain()
    }

    private func requestUsername() {
        let input = prompt(message: "Enter GitHub username:")
        network(input)
    }

    private func prompt(message: String) -> String {
        print(message)
        let input: String = readLine()!
        switch input {
        case "quit":
            exit(0)
        case "":
            return prompt(message: message)
        default:
            return input
        }
    }

    private func network(_ input: String) {
        NetworkConnect().request(
            url: "https://api.github.com/users/\(input)/repos",
            method: .get
        ) { [weak self] (result: NetworkConnect.CallbackResult<[GitHubUserRepoResponse]>) in
            guard let self = self else { return }
            switch result {
            case let .success(response: responseData):
                print("===============================")
                if responseData.isEmpty {
                    print("Repo Not Found")
                } else {
                    print("Repo User \(input): ")
                    responseData.enumerated().forEach {
                        print("\($0 + 1). \($1.name)")
                    }
                }
                print("===============================")
            case let .failure(error: error):
                print(error.localizedDescription)
            }
            self.requestUsername()
        }
    }
}
