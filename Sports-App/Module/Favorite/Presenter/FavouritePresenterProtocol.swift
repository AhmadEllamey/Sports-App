//
//  FavouritePresenterProtocol.swift
//  Sports-App
//
//  Created by Marwan Adel on 5/17/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation

protocol FavouritePresenterProtocol {
    func getAllFavLeaguesFromCoreData()
    func insertFavLeagueToCoreData(league: FavouriteLeague)
    func deleteFavLeagueFromCoreData(league: FavouriteLeague)
}
