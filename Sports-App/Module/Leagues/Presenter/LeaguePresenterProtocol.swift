//
//  LeaguePresenterProtocol.swift
//  Sports-App
//
//  Created by Marwan Adel on 5/14/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation

protocol LeaguePresenterProtocol {
    func getLeaguesOfSportInCountry(link: String ,params: [String : String]?)
    
    func getAllCountries(link: String ,params: [String : String]?)
}
