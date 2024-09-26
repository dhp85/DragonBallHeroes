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
    
    func jwt(_request: URLRequest, completion: @escaping (Result<String, DragonBallHeroes.NetworkError>) -> Void) {
        didCallJwtRequest = true
    }
    
    func request<T>(_ request: URLRequest, using: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T: Decodable {
        receivedRequest = request
        didCallRequest = true
        
        // Llamar al completion con el resultado almacenado o devolver un error por defecto
        if let result = receivedResult as? Result<T, NetworkError> {
            completion(result)
        } else {
            completion(.failure(.unknown))
        }
    }
}
