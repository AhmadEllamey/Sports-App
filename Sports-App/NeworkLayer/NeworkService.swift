//
//  NeworkService.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/13/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation
import Alamofire


class NetworkService : NetworkProtocol  {
    static var networkServiceIntanace = NetworkService()
    
    private init(){}
    
    func getResultFromAPI<T: Decodable>(link: String , params: [String: String]? ,type: T.Type ,complitionHandler: @escaping (T?, Error?) -> Void){
        
        let url = "https://www.thesportsdb.com/api/v1/json/2/" + link
        
        AF.request(url, method: .get, parameters: params).responseDecodable(of: T.self){
            (response) in
            let data = response.result
            switch data{
                case .success(let result):
                    complitionHandler(result , nil)
                case . failure(let error):
                    complitionHandler(nil, error)
            }
        }
    }
}



