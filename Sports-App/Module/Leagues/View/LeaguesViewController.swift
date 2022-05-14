//
//  LeaguesViewController.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/12/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController {
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var myLeagueTable: UITableView!
    
    let pickerView = UIPickerView()
    let indicator = UIActivityIndicatorView(style: .large)
    
    var myPresenter : LeaguePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        countryTextField.inputView = pickerView
        
        myLeagueTable.isHidden = true
        
        myPresenter = LeaguesPresenter(leagueView:self ,repo: Repo.getRepoInstance(netowrk: NetworkService.networkServiceIntanace))
        
        myPresenter?.getAllCountries(link: "all_countries.php", params: nil)
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

extension LeaguesViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myLeagueTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesCellController
        
//        cell.myImageView.image = UIImage(named: "apple.png")
//        cell.myTitleView.text = list[indexPath.row].title
//        cell.myGenreView.text = list[indexPath.row].genre
        
        return cell
    }
    
    
}

extension LeaguesViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Data.countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Data.countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = Data.countries[row]
        countryTextField.resignFirstResponder()
        
        indicator.startAnimating()
        
        myPresenter?.getLeaguesOfSportInCountry(link: "search_all_leagues.php", params: ["c":countryTextField.text ?? "" , "s":"Soccer"])
    }

}

extension LeaguesViewController : LeagueViewProtocol{
    
}
