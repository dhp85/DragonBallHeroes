//
//  APIClientProtocolMock.swift
//  DragonBallHeroesTests
//
//  Created by Diego Herreros Parron on 25/9/24.
//

import Foundation
@testable import DragonBallHeroes

final class APIClientProtocolMock<C: Codable>: APIClientProtocol {
    var didCallRequest = false
    var receivedRequest: URLRequest?
    var receivedResult: Result<C, NetworkError>?
    var didCallJwtRequest = false
    var jwtResult: Result<String, NetworkError>?
    
    func jwt(_request: URLRequest, completion: @escaping (Result<String, DragonBallHeroes.NetworkError>) -> Void) {
        didCallJwtRequest = true
        completion(jwtResult ?? .failure(.unknown))
    }
    
    func request<T>(_ request: URLRequest, using: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T: Decodable {
        receivedRequest = request
        didCallRequest = true
        
        if let result = receivedResult as? Result<T, NetworkError> {
            completion(result)
        } else {
            completion(.failure(.unknown))
        }
    }
}
