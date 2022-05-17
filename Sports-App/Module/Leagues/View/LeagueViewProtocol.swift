//
//  LeagueViewProtocol.swift
//  Sports-App
//
//  Created by Marwan Adel on 5/14/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation

protocol LeagueViewProtocol {
    func updateLeaguesTableView(leagues: [LeaguesData])
    func updateCountryPickerView(countries: [CountriesName])
    func notifyError()
}
