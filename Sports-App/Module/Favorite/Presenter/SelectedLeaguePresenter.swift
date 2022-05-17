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
}
