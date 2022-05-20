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
    
    func getResultFromAPI(link : String , params : [String : String]? ,complitionHandler: @escaping (Any?, Error?) -> Void){
        
        let url = "https://www.thesportsdb.com/api/v1/json/2/" + link
        
        Alamofire.request(url, method: .get , parameters: params).responseJSON{ (response) in
            if let data = response.result.value{
                complitionHandler(data , nil) 
            }
        }
    }
    
    /*
     func getResultFromAPI<T:Decodable>(link : String , params : [String : String]?, type : T ,complitionHandler: @escaping ([T]?, Error?) -> Void){
           
           let url = "https://www.thesportsdb.com/api/v1/json/2/" + link
           
           
           Alamofire.request(url, method: .get , parameters: params).responseJSON{ (response) in
               
               if let data = response.result.value{
                   
                   do {
                       let json = try JSONSerialization.data(withJSONObject: data)
                       let decoder = JSONDecoder()
                       decoder.keyDecodingStrategy = .convertFromSnakeCase
                       let decodedT = try decoder.decode([T].self, from: json)
                       decodedT.forEach{print($0)}
                       //complitionHandler(decodedT, nil)
                       print(data)
                   } catch {
                       print(error)
                   }
                   
               }
               
           }
           
           
       }
 */
}



