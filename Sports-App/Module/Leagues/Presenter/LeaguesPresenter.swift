//
//  LeaguesPresenter.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/12/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation

class LeaguesPresenter : LeaguePresenterProtocol{
    
    var leagueView : LeagueViewProtocol?
    
    var repo : RepoProtocol?
    
    init(leagueView: LeagueViewProtocol, repo: RepoProtocol) {
        self.leagueView = leagueView
        self.repo = repo
    }
    
    func getAllCountries(link: String, params: [String : String]?) {
        repo?.getApiAnswer(link: link, params: params, type: CountriesNameResponse.self){
            (countries, error) in
            
            self.leagueView?.updateCountryPickerView(countries: (countries?.countries)!)
        }
        
    }
    
    func getLeaguesOfSportInCountry(link: String, params: [String : String]?) {
        repo?.getApiAnswer(link: link, params: params, type: LeaguesResponse.self){
            (leagues, error) in
            guard let countries = leagues?.countries else{
                self.leagueView?.notifyError()
                return
            }
            
            self.leagueView?.updateLeaguesTableView(leagues: countries)
        }
        
    }
    
}
