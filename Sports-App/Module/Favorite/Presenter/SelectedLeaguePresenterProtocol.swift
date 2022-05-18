//
//  SelectedLeaguePresenterProtocol.swift
//  Sports-App
//
//  Created by Marwan Adel on 5/17/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation

protocol SelectedLeaguePresenterProtocol {
    func insertFavLeagueToCoreData(league: FavouriteLeague)
    func deleteFavLeagueFromCoreData(league: FavouriteLeague)
    func getLeagueEvents(link : String? , params : [String:String]?)
    func getLeagueTeams(link : String? , params : [String:String]?)
}
