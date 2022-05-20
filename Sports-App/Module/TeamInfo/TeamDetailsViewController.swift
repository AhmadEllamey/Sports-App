//
//  TeamDetailsViewController.swift
//  Sports-App
//
//  Created by Marwan Adel on 5/20/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    var team: TeamDetails?
    
    @IBOutlet weak var stadiumImage: UIImageView!
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamFormedYearLabel: UILabel!
    @IBOutlet weak var teamCountryLabel: UILabel!
    @IBOutlet weak var stadiunNameDetailLabel: UILabel!
    @IBOutlet weak var stadiumDescriptionLabel: UILabel!
    @IBOutlet weak var stadiumCapacity: UILabel!
    
    
    @IBAction func websiteBt(_ sender: UIButton) {
    }
    
    @IBAction func youtubeBt(_ sender: UIButton) {
    }
    
    @IBAction func facebookBt(_ sender: UIButton) {
    }
    
    @IBAction func twitterBt(_ sender: UIButton) {
    }
    @IBAction func instagramBt(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
