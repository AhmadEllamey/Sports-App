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
    
    var list: [FavouriteLeague] = []
    
    init(favouriteView: FavouriteViewProtocol, repo: RepoProtocol) {
        self.favouriteView = favouriteView
        self.repo = repo
    }
    
    func getAllFavLeaguesFromCoreData(){
        list = repo?.getAllFavLeagueFromCoreData() ?? []
        favouriteView?.updateSuccess(leagues: list)
    }
    
    func deleteFavLeagueFromCoreData(league: FavouriteLeague){
        let result = repo?.deleteFavLeagueFromCoreData(league: league)
        list = repo?.getAllFavLeagueFromCoreData() ?? []
        favouriteView?.updateSuccess(leagues: list)
//        if result == 1{
//            let data = getAllFavLeaguesFromCoreData()
//            favouriteView?.updateSuccess(leagues: list)
//        }else{
//            favouriteView?.updateFail()
//        }
    }
}
