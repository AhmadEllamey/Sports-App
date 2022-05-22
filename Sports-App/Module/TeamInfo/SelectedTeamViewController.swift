//
//  SelectedTeamViewController.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/21/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import UIKit

class SelectedTeamViewController: UIViewController {
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        stadiumImage.kf.setImage(with: URL(string : team?.strStadiumThumb ?? ""), placeholder: UIImage(named:"defaultImage"))
        
        stadiumLabel.text = team?.strStadium
        
        teamImage.kf.setImage(with: URL(string: team?.strTeamBadge ?? ""), placeholder: UIImage(named: "defaultImage"))
        
        teamImage.layer.cornerRadius = teamImage.layer.frame.height/2
        teamImage.layer.borderWidth = 1
        teamImage.layer.masksToBounds = false
        teamImage.layer.borderColor = UIColor.black.cgColor
        teamImage.clipsToBounds = true
        
        teamNameLabel.text = team?.strTeam
        teamFormedYearLabel.text = team?.intFormedYear
        
        teamCountryLabel.text = team?.strCountry
        
        stadiunNameDetailLabel.text = team?.strStadium
        stadiumDescriptionLabel.text = team?.strStadiumDescription
        stadiumCapacity.text = team?.intStadiumCapacity
    }
    
    
    @IBAction func websiteBt(_ sender: UIButton) {
        let url = NSURL(string: "https://"+(team?.strWebsite)!)!
        
        openLink(link: url)
    }
    
    @IBAction func youtubeBt(_ sender: UIButton) {
        let url = NSURL(string: "https://"+(team?.strYoutube)!)!
        
        openLink(link: url)
    }
    
    @IBAction func facebookBt(_ sender: UIButton) {
        let url = NSURL(string: "https://"+(team?.strFacebook)!)!
        
        openLink(link: url)
    }
    
    @IBAction func twitterBt(_ sender: UIButton) {
        let url = NSURL(string: "https://"+(team?.strTwitter)!)!
        
        openLink(link: url)
    }
    @IBAction func instagramBt(_ sender: UIButton) {
        let url = NSURL(string: "https://"+(team?.strInstagram)!)!
        
        openLink(link: url)
    }
    
    func openLink(link: NSURL){
        if UIApplication.shared.canOpenURL(link as! URL){
            UIApplication.shared.open((link as? URL)!)
        }
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
