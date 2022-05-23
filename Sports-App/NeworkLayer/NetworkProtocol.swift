//
//  NetworkProtocol.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/13/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation


protocol NetworkProtocol {
    func getResultFromAPI<T: Decodable>(link: String , params: [String: String]? ,type: T.Type ,complitionHandler: @escaping (T?, Error?) -> Void)
}
