//
//  CoreDatePorotcol.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/13/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation


protocol CoreDataProtocol {
    func insertLeagueToCoreData(league : FavouriteLeague) -> Int
    func getAllFavLeagueFromCoreData() -> [FavouriteLeague]
    func deleteFavLeagueFromCoreData(league: FavouriteLeague) -> Int
}
