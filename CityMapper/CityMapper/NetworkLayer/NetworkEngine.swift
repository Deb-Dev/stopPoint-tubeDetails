//
//  NetworkEngine.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 26/01/22.
//

import Foundation
import Combine
class NetworkEngine {
    static let shared = NetworkEngine()
    
    private init() {
        
    }
    
    
    func getData<T: Decodable>(endpoint: EndpointProtocol, type: T.Type, onCompletion handler: @escaping (Result<T, Error>)->() ) {
            var components = URLComponents()
            components.scheme = endpoint.scheme
            components.host = endpoint.baseURL
            components.path = endpoint.path
            components.queryItems = endpoint.parameters
            
            
            guard let url = components.url else {
                handler(.failure(NetworkError.invalidURL))
                return
            }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode,
            error == nil else {
                handler(.failure(NetworkError.responseError))
                return
            }
            if let response = try? JSONDecoder().decode(T.self, from: data) {
                handler(.success(response))
            } else {
                handler(.failure(NetworkError.responseError))
            }
        }.resume()
    }
    
    
    
    
    
    
    private var cancellables = Set<AnyCancellable>()
    // this method is not in use. Was trying to use combine
    func getData<T: Decodable>(endpoint: EndpointProtocol, type: T.Type) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            guard let self = self else {
                return promise(.failure(NetworkError.unknown))
            }
            var components = URLComponents()
            components.scheme = endpoint.scheme
            components.host = endpoint.baseURL
            components.path = endpoint.path
            components.queryItems = endpoint.parameters
            
            
            guard let url = components.url else {
                return promise(.failure(NetworkError.invalidURL))
            }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.current)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: {
                    promise(.success($0))
                    
                })
                .store(in: &self.cancellables)
        }
    }
    
    
}
