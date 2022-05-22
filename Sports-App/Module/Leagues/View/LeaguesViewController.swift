//
//  LeaguesViewController.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/12/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import UIKit
import Kingfisher

class LeaguesViewController: UIViewController {
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var myLeagueTable: UITableView!
    
    let pickerView = UIPickerView()
    let indicator = UIActivityIndicatorView(style: .large)
    
    var myPresenter : LeaguePresenterProtocol?
    
    var countries: [CountriesName] = []
    var leagues: [LeaguesData] = []
    
    var sport:String?
    
    var leagueDetailsVC : SelectedLeagueViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        myLeagueTable.delegate = self
        myLeagueTable.dataSource = self
        
        countryTextField.inputView = pickerView
        countryTextField.isEnabled = false
        
        myLeagueTable.isHidden = true
        myLeagueTable.separatorStyle = .none
        myLeagueTable.showsVerticalScrollIndicator = false
        
        myPresenter = LeaguesPresenter(leagueView:self ,repo: Repo.getRepoInstance(netowrk: NetworkService.networkServiceIntanace, coreData: CoreDataService.coreDataServiceIntanace))
        
        myPresenter?.getAllCountries(link: "all_countries.php", params: nil)
    }
    
 
    
}

extension LeaguesViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myLeagueTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesCellController
        
        cell.leagueImage.kf.setImage(with: URL(string : leagues[indexPath.row].strBadge ?? ""), placeholder: UIImage(named:"defaultImage"))
        cell.leagueName.text = leagues[indexPath.row].strLeague
 
        if leagues[indexPath.row].strYoutube == ""{
            cell.setVisibilityToFalse()
        }else{
            cell.setVisibilityToTrue()
        }
        
        cell.youtubeTapClosure = { [weak self] in
            guard let self = self else{
                return
            }
 
            let youtubeURL = NSURL(string: "https://"+self.leagues[indexPath.row].strYoutube!)
            
            if UIApplication.shared.canOpenURL(youtubeURL as! URL){
                UIApplication.shared.open((youtubeURL as? URL)!)
            }
        }
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height/3
        cell.leagueImage.layer.cornerRadius = cell.leagueImage.frame.height/2
        cell.leagueImage.layer.borderWidth = 1
        cell.leagueImage.layer.masksToBounds = false
        cell.leagueImage.layer.borderColor = UIColor.black.cgColor
        cell.leagueImage.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        leagueDetailsVC = self.storyboard?.instantiateViewController(identifier: "LeagueDetails") as! SelectedLeagueViewController
        
        leagueDetailsVC?.leagueNameString = leagues[indexPath.row].strLeague
        leagueDetailsVC?.leagueImageUrl = leagues[indexPath.row].strBadge
        leagueDetailsVC?.leagueId = leagues[indexPath.row].idLeague
        leagueDetailsVC?.yLink = leagues[indexPath.row].strYoutube
        
        
        self.present(leagueDetailsVC!, animated: true, completion: nil)
        
    }
    
}

extension LeaguesViewController : UIPickerViewDelegate, UIPickerViewDataSource{
     
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row].nameEn
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = countries[row].nameEn
        countryTextField.resignFirstResponder()
        
        indicator.startAnimating()
        
        if Reachability.isConnectedToNetwork() {
                myPresenter?.getLeaguesOfSportInCountry(link: "search_all_leagues.php", params: ["c":countryTextField.text ?? "" , "s":sport!])
                
                leagues = []
                myLeagueTable.reloadData()
                myLeagueTable.isHidden = true
        }
    }

}

extension LeaguesViewController : LeagueViewProtocol{
    func notifyError() {
        indicator.stopAnimating()
        myLeagueTable.isHidden = true
    }
    
    func updateLeaguesTableView(leagues: [LeaguesData]) {
        indicator.stopAnimating()
        self.leagues = leagues
        myLeagueTable.isHidden = false
        myLeagueTable.reloadData()
    }
    
    func updateCountryPickerView(countries: [CountriesName]) {
        countryTextField.isEnabled = true
        self.countries = countries
        pickerView.reloadAllComponents()
    }
}
