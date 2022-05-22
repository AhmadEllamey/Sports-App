//
//  Sports_AppTests.swift
//  Sports-AppTests
//
//  Created by Ahmad Ellamey on 5/11/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import XCTest
@testable import Sports_App

class Sports_AppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

// test code
//func testGetAllSports(){
//    let expectaion = expectation(description: "Waiting All Sports")
//    networkManager.loadData(url: Constants.ALLSPORTS, param: [:], responseType: AllSports.self) { (sports, error) in
//            guard let sports = sports else{
//                XCTFail()
//                expectaion.fulfill()
//                return
//            }
//        XCTAssertEqual(sports.sports!.count, 34, "API Faild")
//            expectaion.fulfill()
//        }
//        waitForExpectations(timeout: 5, handler: nil)
//    }
//
//func testGetAllLeagues(){
//    let expectaion = expectation(description: "Waiting All Sports")
//    networkManager.loadData(url: Constants.ALLLEAGUES, param: ["s":"Soccer"], responseType: AllLeagues.self) { (leagues, error) in
//            guard let leagues = leagues else{
//                XCTFail()
//                expectaion.fulfill()
//                return
//            }
//            XCTAssertEqual(leagues.countries!.count, 10, "API Faild")
//            expectaion.fulfill()
//        }
//        waitForExpectations(timeout: 5, handler: nil)
//}
//
//
//func testGetTeamDetail(){
//    let expectaion = expectation(description: "Waiting All Sports")
//    networkManager.loadData(url: Constants.AllTeams, param: ["c": "Spain", "s":"Soccer"], responseType: AllTeams.self) { (teams, error) in
//            guard let teams = teams else{
//                XCTFail()
//                expectaion.fulfill()
//                return
//            }
//        XCTAssertEqual(teams.teams.count, 50, "API Faild")
//            expectaion.fulfill()
//        }
//        waitForExpectations(timeout: 5, handler: nil)
//}
//
//func testGetLastestEvent(){
//    let expectaion = expectation(description: "Waiting All Sports")
//    networkManager.loadData(url: Constants.LatestEvent, param: ["id":"4328"], responseType: EventResponse.self) { (events, error) in
//            guard let events = events else{
//                XCTFail()
//                expectaion.fulfill()
//                return
//            }
//        XCTAssertEqual(events.events.count, 100, "API Faild")
//            expectaion.fulfill()
//        }
//        waitForExpectations(timeout: 5, handler: nil)
//}



