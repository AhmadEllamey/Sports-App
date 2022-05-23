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
        repoRef?.getApiAnswer(link: link, params: params, type: SportsResponse.self){
            (sports, error) in
            
            self.viewRef?.refreshSports(list: sports!.sports)
        }
    }
}
