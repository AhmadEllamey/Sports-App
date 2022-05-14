//
//  NetworkProtocol.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/13/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation


protocol NetworkProtocol {
    
    
    
    func getResultFromAPI(link : String , params : [String : String]? ,complitionHandler: @escaping (Any?, Error?) -> Void)
    
    
    
}
