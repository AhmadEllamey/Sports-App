//
//  Sports.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/13/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation

class Sports:Codable{
    let idSport, strSport: String
    let strFormat: String
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
     
    
    init(idSport:String,strSport:String,strFormat:String,strSportThumb:String,strSportIconGreen:String,strSportDescription:String) {
        self.idSport = idSport
        self.strSport = strSport
        self.strFormat = strFormat
        self.strSportThumb = strSportThumb
        self.strSportIconGreen = strSportIconGreen
        self.strSportDescription = strSportDescription
        
    }
    
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idSport = try values.decode(String.self, forKey: .idSport)
        strSport = try values.decode(String.self, forKey: .strSport)
        strFormat = try values.decode(String.self, forKey: .strFormat)
        strSportThumb = try values.decode(String.self, forKey: .strSportThumb)
        strSportIconGreen = try values.decode(String.self, forKey: .strSportIconGreen)
        strSportDescription = try values.decode(String.self, forKey: .strSportDescription)
    }
}

