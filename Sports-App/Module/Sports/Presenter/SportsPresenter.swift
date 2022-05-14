//
//  SportsPresenter.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/12/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation


class SportsPresenter: SportsProtocol {
    
    
    var viewRef : SportsViewProtocol?
    
    var repoRef : RepoProtocol?
    
    init(viewRef:SportsViewProtocol , repoRef : RepoProtocol) {
        self.viewRef = viewRef
        self.repoRef = repoRef
    }
    
     
    
    func getSports(link : String , params : [String : String]? ){
        
        repoRef?.getApiAnswer(link: link, param: params){ (sports, error) in
            
            guard let sports = sports else{
                    print("sports")
                    return
                  }
            do{
                 let json = try JSONSerialization.data(withJSONObject: sports)
                 let decoder = JSONDecoder()
                 decoder.keyDecodingStrategy = .convertFromSnakeCase
                 let decodedT = try decoder.decode(SportsResponse.self, from: json)
                 print(decodedT.sports[0].idSport)
             }catch{
                 print(error)
             }
        }
        
    }
    
    
    
}
