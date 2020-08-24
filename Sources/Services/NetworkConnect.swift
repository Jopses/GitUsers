import Foundation
import Alamofire

public protocol NetworkConnectInput {
    func request<D: Decodable>(
    url: String,
    method: HTTPMethod,
    completion: @escaping NetworkConnect.Callback<D>
    )
}

public class NetworkConnect: NetworkConnectInput {
    public enum CallbackResult<D: Decodable> {
        case success(response: D)
        case failure(error: Error)
    }

    public typealias Callback<D: Decodable> = (CallbackResult<D>) -> Void

    public init() {}
    
    public func request<D>(
        url: String,
        method: HTTPMethod,
        completion: @escaping Callback<D>) where D : Decodable {
        AF.request(
            url,
            method: method
        )
            .responseDecodable(of: D.self) { response in
                switch response.result {
                case .success:
                    guard let responseObject = response.value else {
                        completion(.failure(error: NCErrors.failedData))
                        return
                    }
                    completion(.success(response: responseObject))
                case let .failure(error):
                    completion(.failure(error: error))
                    
                }
        }
        
    }

}
