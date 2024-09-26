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
    private var mock: APIClientProtocolMock<[DragonBallCharacter]>!
    
    override func setUp() {
        super.setUp()
        
        mock = APIClientProtocolMock()
        sut = NetworkModel(client: mock)
    }
    
    func test_getHeroes_success() {
        //Given
        let someResult = Result<[DragonBallCharacter], NetworkError>.success([])
        mock.receivedResult = someResult
        var receivedResult: Result<[DragonBallCharacter], NetworkError>?
        let expectedURL = URL(string: "https://dragonball.keepcoding.education/api/heros/all")!
        var expectedRequest = URLRequest(url: expectedURL)
        expectedRequest.httpMethod = "POST"
        
        //When
        sut.getHeroes { result in
            receivedResult = result
        }
        
        //Then
        XCTAssertEqual(someResult, receivedResult)
        XCTAssert(mock.didCallRequest)
    }
    
    func test_Heroes_faulure() {
        //Given
        let someResult = Result<[DragonBallCharacter], NetworkError>.failure(.unknown)
        mock.receivedResult = someResult
        var receivedResult = Result<[DragonBallCharacter], NetworkError>?
        //When
        sut.getHeroes { result in
            receivedResult = result
        }
        
        //Then
        XCTAssertEqual(someResult, receivedResult)
        XCTAssert(mock.didCallRequest)
    }
}
