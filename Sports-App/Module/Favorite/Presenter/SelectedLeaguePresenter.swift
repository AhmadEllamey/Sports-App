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
        repo?.getApiAnswer(link: link!, params: params, type: SportsEvents.self){
            (leaguesEvents, error) in
            
            self.selectedLeagueView?.refreshEventsList(list: leaguesEvents?.events!)
        }
        
    }
    
    func getLeagueTeams(link : String? , params : [String : String]? ){
        repo?.getApiAnswer(link: link!, params: params, type: Teams.self){
            (teams, error) in
            
            self.selectedLeagueView?.refreshTeamsList(list: teams?.teams!)
        }
        
    }
    
}
