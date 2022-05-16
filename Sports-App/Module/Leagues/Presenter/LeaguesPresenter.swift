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
        repo?.getApiAnswer(link: link, param: params){ (countries, error) in
            guard let countries = countries else{
                print("countries")
                return
            }
            
            do{
                let json = try JSONSerialization.data(withJSONObject: countries)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedT = try decoder.decode(CountriesNameResponse.self, from: json)
                
                guard let countriesData = decodedT.countries else {
                    return
                }
                
                self.leagueView?.updateCountryPickerView(countries: countriesData)
                
            }catch{
                print(error)
            }
        }
    }
    
    func getLeaguesOfSportInCountry(link: String, params: [String : String]?) {
        repo?.getApiAnswer(link: link, param: params){ (leagues, error) in
            
            guard let leagues = leagues else{
                print("leagues")
                return
            }
            do{
                let json = try JSONSerialization.data(withJSONObject: leagues)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedT = try decoder.decode(LeaguesResponse.self, from: json)
                
                guard let leaguesData = decodedT.countries else {
                    return
                }
                
                self.leagueView?.updateLeaguesTableView(leagues: leaguesData)
            }catch{
                print("Hi :\(error)")
            }
        }
    }
    
}
