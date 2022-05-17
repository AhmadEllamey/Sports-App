//
//  FavoritePresenter.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/12/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation

class FavouritePresenter: FavouritePresenterProtocol {
    var favouriteView : FavouriteViewProtocol?
    
    var repo : RepoProtocol?
    
    init(favouriteView: FavouriteViewProtocol, repo: RepoProtocol) {
        self.favouriteView = favouriteView
        self.repo = repo
    }
    
    func getAllFavLeaguesFromCoreData(){
        let data = repo?.getAllFavLeagueFromCoreData()
        //favouriteView.kza 
    }
    
    func insertFavLeagueToCoreData(league: FavouriteLeague){
        let result = repo?.insertFavLeagueToCoreData(league: league)
        if result == 1{
            getAllFavLeaguesFromCoreData()
        }
    }
    
    func deleteFavLeagueFromCoreData(league: FavouriteLeague){
        let result = repo?.deleteFavLeagueFromCoreData(league: league)
        if result == 1{
            getAllFavLeaguesFromCoreData()
        }
    }
}
