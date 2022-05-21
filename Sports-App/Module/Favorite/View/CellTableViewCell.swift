//
//  CellTableViewCell.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/12/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    var youtubeTapClosure: (()->())?
    
    @IBOutlet weak var youtubeBtOutlet: UIButton!
    
    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var leagueName: UILabel!
    
    @IBAction func youtubeBt(_ sender: Any) {
        youtubeTapClosure?()
    }
    
    @IBOutlet weak var cellView: UIView!
    
    
    func setVisibilityToFalse(){
        youtubeBtOutlet.isHidden = true
    }
    
    func setVisibilityToTrue(){
        youtubeBtOutlet.isHidden = false
    }
}
