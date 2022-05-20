//
//  SelectedLeaguePresenter.swift
//  Sports-App
//
//  Created by Marwan Adel on 5/17/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation

class SelectedLeaguePresenter: SelectedLeaguePresenterProtocol{
    
    var selectedLeagueView : SelectedLeagueViewProtocol?
    var repo : RepoProtocol?
    
    init(selectedLeagueView: SelectedLeagueViewProtocol, repo: RepoProtocol) {
        self.selectedLeagueView = selectedLeagueView
        self.repo = repo
    }
    
    func insertFavLeagueToCoreData(league: FavouriteLeague){
        let result = repo?.insertFavLeagueToCoreData(league: league)
    }
    
    func deleteFavLeagueFromCoreData(league: FavouriteLeague){
        let result = repo?.deleteFavLeagueFromCoreData(league: league)
    }
    
    func checkForLeagueInCoreData(league: FavouriteLeague){
        let result = repo?.checkForFavLeagueInCoreData(league: league)
        if result == 1 {
            selectedLeagueView?.updateTheFavState()
        }
    }
    
    func getLeagueEvents(link : String? , params : [String : String]? ){
        repo?.getApiAnswer(link: link!, param: params){ (leaguesEvents, error) in
            
            guard let leaguesEvents = leaguesEvents else{
                print("---------------")
                return
            }
            do{ 
                let json = try JSONSerialization.data(withJSONObject: leaguesEvents)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedT = try decoder.decode(SportsEvents.self, from: json)
                self.selectedLeagueView?.refreshEventsList(list: decodedT.events!)
            }catch{
                print(error)
                print("***************")
            }
        }
    }
    
    func getLeagueTeams(link : String? , params : [String : String]? ){
        repo?.getApiAnswer(link: link!, param: params){ (teams, error) in
            
            guard let teams = teams else{
                return
            }
            do{ 
                let json = try JSONSerialization.data(withJSONObject: teams)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedT = try decoder.decode(Teams.self, from: json)
                self.selectedLeagueView?.refreshTeamsList(list: decodedT.teams!)
            }catch{
                print(error)
            }
        }
    }
    
    
    
}
