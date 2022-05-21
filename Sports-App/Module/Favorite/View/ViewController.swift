//
//  ViewController.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/11/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myFavTable: UITableView!
    
    var leagues: [FavouriteLeague] = []

    var leagueDetailsVC : SelectedLeagueViewController?
    var myPresenter : FavouritePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myFavTable.delegate = self
        myFavTable.dataSource = self
        
        
        myPresenter = FavouritePresenter(favouriteView:self ,repo: Repo.getRepoInstance(netowrk: NetworkService.networkServiceIntanace, coreData: CoreDataService.coreDataServiceIntanace))
    
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        myPresenter?.getAllFavLeaguesFromCoreData()
    }
    
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myFavTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTableViewCell
        
        cell.leagueImage.image = UIImage(data:  (leagues[indexPath.row].image!) as! Data) ?? UIImage(named:"defaultImage")
        
        cell.leagueName.text = leagues[indexPath.row].name
        
        if leagues[indexPath.row].ytLink == ""{
            cell.setVisibilityToFalse()
        }else{
            cell.setVisibilityToTrue()
        }
        
        cell.youtubeTapClosure = { [weak self] in
            guard let self = self else{
                return
            }
            
            let youtubeURL = NSURL(string: "https://"+self.leagues[indexPath.row].ytLink!)
            
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            myPresenter?.deleteFavLeagueFromCoreData(league: leagues[indexPath.row])
            //leagues.remove(at: indexPath.row)
            //tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(leagues[indexPath.row].imageUrl!)
        print("'hello'")
        
        leagueDetailsVC = self.storyboard?.instantiateViewController(identifier: "LeagueDetails") as! SelectedLeagueViewController
        
        leagueDetailsVC?.leagueNameString = leagues[indexPath.row].name
        print(leagues[indexPath.row].imageUrl!)
        leagueDetailsVC?.leagueImageUrl = leagues[indexPath.row].imageUrl
        leagueDetailsVC?.leagueId = leagues[indexPath.row].id
        leagueDetailsVC?.yLink = leagues[indexPath.row].ytLink
        
        
        self.present(leagueDetailsVC!, animated: true, completion: nil)
        
    }
}

extension ViewController: FavouriteViewProtocol{
    func updateSuccess(leagues: [FavouriteLeague]) {
        self.leagues = leagues
        myFavTable.reloadData()
    }
    
    func updateFail() {
        
    }
}
