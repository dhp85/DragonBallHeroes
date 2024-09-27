//
//  DragonBallHeroesTests.swift
//  DragonBallHeroesTests
//
//  Created by Diego Herreros Parron on 25/9/24.
//

import XCTest
@testable import DragonBallHeroes

final class NetworkModelTests: XCTestCase {
    private var sut: NetworkModel!
    private var sutTransformations: NetworkModel!
    private var mock: APIClientProtocolMock<[DragonBallCharacter]>!
    private var mockTrasformations: APIClientProtocolMock<[Transformation]>!
    
    override func setUp() {
        super.setUp()
        mockTrasformations = APIClientProtocolMock()
        mock = APIClientProtocolMock()
        sut = NetworkModel(client: mock)
        sutTransformations = NetworkModel(client: mockTrasformations)
    }
    
    func test_getHeroes_success() {
        // Given
        let someResult = Result<[DragonBallCharacter], NetworkError>.success([DragonBallCharacter]())
        mock.receivedResult = someResult
        let expectedToken = "🤥fakeToken🤥"
        mock.jwtResult = .success(expectedToken)
        var receivedResult: Result<[DragonBallCharacter], NetworkError>?
        
        // When
        sut.login(user: "🐉Dragon🐉", password: "🔮Ball🔮") { _ in
            self.sut.getHeroes { result in
                receivedResult = result
            }
        }
        
        // Then
        XCTAssertEqual(someResult, receivedResult)
        XCTAssert(mock.didCallRequest)
    }
    
    
    func test_getHeroes_faulure() {
        // Given
        let someResult = Result<[DragonBallCharacter], NetworkError>.failure(.unknown)
        mock.receivedResult = someResult
        let expectedToken = "🤥fakeToken🤥"
        mock.jwtResult = .success(expectedToken)
        var receivedResult: Result<[DragonBallCharacter], NetworkError>?
        
        // When
        sut.login(user: "🐉Dragon🐉", password: "🔮Ball🔮") { _ in
            self.sut.getHeroes { result in
                receivedResult = result
            }
        }
        
        //Then
        XCTAssertEqual(someResult, receivedResult)
        XCTAssert(mock.didCallRequest)
        
    }
    
    func test_getTransformations_success() {
        
        //Given
        let someResult = Result<[Transformation], NetworkError>.success([Transformation]())
        mockTrasformations.receivedResult = someResult
        let expectedToken = "🤥fakeToken🤥"
        mockTrasformations.jwtResult = .success(expectedToken)
        var receivedResult: Result<[Transformation], NetworkError>?
        let heroes = DragonBallCharacter(name: "Goku", photo: nil, description: "Saiyan", favorite: true, id: "1")
        
        //When
        sutTransformations.login(user: "🐉Dragon🐉", password: "🔮Ball🔮") { _ in
            self.sutTransformations.getTransformations(for: heroes) { result in
                receivedResult = result
            }
        }
        
        //Then
        XCTAssertEqual(someResult, receivedResult)
        XCTAssert(mockTrasformations.didCallRequest)
        
    }
    
    func test_getTransformations_failure() {
        //Given
        let someResult = Result<[Transformation], NetworkError>.failure(.unknown)
        mockTrasformations.receivedResult = someResult
        let expectedToken = "🤥fakeToken🤥"
        mockTrasformations.jwtResult = .success(expectedToken)
        var receivedResult: Result<[Transformation], NetworkError>?
        let heroes = DragonBallCharacter(name: "Goku", photo: nil, description: "Saiyan", favorite: true, id: "1")
        
        //When
        sutTransformations.login(user: "🐉Dragon🐉", password: "🔮Ball🔮") { _ in
            self.sutTransformations.getTransformations(for: heroes) { result in
                receivedResult = result
            }
        }
        
        //Then
        XCTAssertEqual(someResult, receivedResult)
        XCTAssert(mockTrasformations.didCallRequest)
        
    }
    
}
    
    
