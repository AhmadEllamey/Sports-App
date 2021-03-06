//
//  Repo.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/13/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation
 
class Repo: RepoProtocol {
    private static var repoInstanace : Repo?
    
    private var networkService: NetworkProtocol?
    private var coreDataService: CoreDataProtocol?
    
    private init(network : NetworkProtocol, coreData: CoreDataProtocol){
        networkService = network
        coreDataService = coreData
    }
    
    static func getRepoInstance(netowrk : NetworkProtocol, coreData: CoreDataProtocol) -> Repo {
        if repoInstanace == nil{
            repoInstanace = Repo(network: netowrk, coreData: coreData)
        }
        
        return repoInstanace!
    }

    func getApiAnswer<T: Decodable>(link: String , params: [String: String]? ,type: T.Type , complitionHandler: @escaping (T?, Error?) -> Void ){
        networkService?.getResultFromAPI(link: link, params: params, type: type){
            (data , error) in
            complitionHandler(data,error)
        }
//        networkService?.getResultFromAPI(link: link, params: param ){ (sports , error) in
//            complitionHandler(sports,error)
//        }
    }
    
    func getAllFavLeagueFromCoreData() -> [FavouriteLeague]{
        return (coreDataService?.getAllFavLeagueFromCoreData())!
    }
    
    func insertFavLeagueToCoreData(league: FavouriteLeague) -> Int{
        return coreDataService?.insertLeagueToCoreData(league: league) ?? 0
    }
    
    func deleteFavLeagueFromCoreData(league: FavouriteLeague) -> Int{
        return coreDataService?.deleteFavLeagueFromCoreData(league: league) ?? 0
    }
    
    func checkForFavLeagueInCoreData(league: FavouriteLeague) -> Int{
        return coreDataService?.checkForFavLeagueInCoreData(league: league) ?? 0
    }
     
}
