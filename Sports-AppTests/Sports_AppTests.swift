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
    let networkManager = NetworkService.networkServiceIntanace
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testForSports(){
        let expectaion = expectation(description: "Sports")
        networkManager.getResultFromAPI(link: "all_sports.php", params: nil, type: SportsResponse.self){(sports, error) in
            
            guard let sports = sports else{
                XCTFail()
                expectaion.fulfill()
                return
            }
            XCTAssertEqual(sports.sports.count, 34, "API Faild")
            expectaion.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    func testForTeams(){
        let expectaion = expectation(description: "Teams")
        networkManager.getResultFromAPI(link: "search_all_teams.php", params: ["l":"English Premier League"], type: Teams.self){(teams, error) in
            
            guard let teams = teams else{
                XCTFail()
                expectaion.fulfill()
                return
            }
            XCTAssertEqual(teams.teams!.count, 20, "API Faild")
            expectaion.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    func testForLeagues(){
        let expectaion = expectation(description: "Leagues")
        networkManager.getResultFromAPI(link: "search_all_leagues.php", params: ["c":"Egypt", "s":"Soccer"], type: LeaguesResponse.self){(leagues, error) in
            
            guard let leagues = leagues else{
                XCTFail()
                expectaion.fulfill()
                return
            }
            XCTAssertEqual(leagues.countries?.count, 2, "API Faild")
            expectaion.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testForEvents(){
        let expectaion = expectation(description: "Event")
        networkManager.getResultFromAPI(link: "eventsseason.php", params: ["id":"4328"], type: SportsEvents.self){(events, error) in
            
            guard let events = events else{
                XCTFail()
                expectaion.fulfill()
                return
            }
            XCTAssertEqual(events.events?.count, 100, "API Faild")
            expectaion.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testForCountries(){
        let expectaion = expectation(description: "Countries")
        networkManager.getResultFromAPI(link: "all_countries.php", params: nil, type: LeaguesResponse.self){(countries, error) in
            
            guard let countries = countries else{
                XCTFail()
                expectaion.fulfill()
                return
            }
            XCTAssertEqual(countries.countries?.count, 257, "API Faild")
            expectaion.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
