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
    
    private var networkService : NetworkProtocol?
    
    private init(network : NetworkProtocol){
        networkService = network
    }
    
    static func getRepoInstance(netowrk : NetworkProtocol) -> Repo {
        if repoInstanace == nil{
            repoInstanace = Repo(network: netowrk)
        }
        
        return repoInstanace!
    }
 
    func getApiAnswer(link : String , param : [String : String]? , complitionHandler: @escaping (Any?, Error?) -> Void ){
        networkService?.getResultFromAPI(link: link, params: param ){ (sports , error) in
            complitionHandler(sports,error)
        }
    }
     
 
 
    
}
