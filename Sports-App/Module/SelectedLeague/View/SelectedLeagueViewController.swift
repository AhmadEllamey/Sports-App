//
//  SelectedLeagueViewController.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/12/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import UIKit
import Kingfisher

class SelectedLeagueViewController: UIViewController {

    
    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var leagueName: UILabel!
    
    @IBOutlet weak var leagueUpcomingEvents: UICollectionView!
    
    @IBOutlet weak var leagueLatestEvents: UICollectionView!
    
    @IBOutlet weak var leagueTeams: UICollectionView!
    
    @IBOutlet weak var myScrollView: UIScrollView!
    
    var leagueUpcomingEventsList = [EventsDetails]()
    var leagueLatestEventsList = [EventsDetails]()
    var leagueTeamsList = [TeamDetails]()
    
    
    var leagueNameString : String?
    var leagueId : String?
    var leagueImageUrl : String?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(myScrollView.contentSize)
        // Do any additional setup after loading the view.
        leagueUpcomingEvents.delegate = self
        leagueUpcomingEvents.dataSource = self
        leagueLatestEvents.delegate = self
        leagueLatestEvents.dataSource = self
        leagueTeams.delegate = self
        leagueTeams.dataSource = self
        
        // for testing
        //leagueNameString = "English Premier League"
        //leagueId = "4328"
        //leagueImageUrl = "https://www.thesportsdb.com/images/media/team/badge/xtxwtu1448813356.png"
        // ----------------
        
        self.leagueName.text = leagueNameString
        
        if Reachability.isConnectedToNetwork(){
            // request the list of sports
            let myPresenter : SelectedLeaguePresenterProtocol?
            myPresenter = SelectedLeaguePresenter(selectedLeagueView:self , repo : Repo.getRepoInstance(netowrk: NetworkService.networkServiceIntanace, coreData: CoreDataService.coreDataServiceIntanace))
            // request the data
            
            // request the league image
            let myUrl = Foundation.URL.init(string: self.leagueImageUrl!)
            let resource = ImageResource(downloadURL: myUrl!)
            KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                switch result {
                case .success(let value):
                    self.leagueImage.image = value.image
                case .failure( _):
                    self.leagueImage.image = UIImage(named:"sports.jpeg")
                }
            }
            
            // request the league events
            myPresenter?.getLeagueEvents(link: "eventsseason.php", params: ["id":self.leagueId!])
            // request the league teams
            myPresenter?.getLeagueTeams(link: "search_all_teams.php", params: ["l":self.leagueNameString!])
 
        }
    }
}

extension SelectedLeagueViewController: SelectedLeagueViewProtocol{
    
    func refreshEventsList(list: [EventsDetails]?) {
        // set the data
        self.leagueUpcomingEventsList = list!
        self.leagueLatestEventsList = list!
        // reload the data
        self.leagueLatestEvents.reloadData()
        self.leagueUpcomingEvents.reloadData()
    }
    func refreshTeamsList(list: [TeamDetails]?) {
        self.leagueTeamsList = list!
        self.leagueTeams.reloadData()
    }
}


extension SelectedLeagueViewController : UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
        // request the list of sports
    }
    
    func setEmptyMessage(_ message: String , collectionV : UICollectionView) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        messageLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(SelectedLeagueViewController.tapFunction))
        messageLabel.addGestureRecognizer(tap)
        collectionV.backgroundView = messageLabel;
    }
    
    func restore(collectionV : UICollectionView) {
        collectionV.backgroundView = nil
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if collectionView == self.leagueUpcomingEvents{
            if (self.leagueUpcomingEventsList.count == 0) {
                
                if !Reachability.isConnectedToNetwork(){
                    setEmptyMessage("No Internet Connection ... \n click to re-try",collectionV: collectionView)
                }else {
                    setEmptyMessage("Loading Data ...", collectionV: collectionView)
                }
            } else {
                restore(collectionV: collectionView)
            }
            return self.leagueUpcomingEventsList.count
            
        }else if collectionView == self.leagueLatestEvents{
            
            if (self.leagueLatestEventsList.count == 0) {
                if !Reachability.isConnectedToNetwork(){
                    setEmptyMessage("No Internet Connection ... \n click to re-try",collectionV: collectionView)
                }else {
                    setEmptyMessage("Loading Data ...", collectionV: collectionView)
                }
            } else {
                restore(collectionV: collectionView)
            }
            return self.leagueLatestEventsList.count
            
        }else if collectionView == self.leagueTeams{
            if (self.leagueTeamsList.count == 0) {
                if !Reachability.isConnectedToNetwork(){
                    setEmptyMessage("No Internet Connection ... \n click to re-try",collectionV: collectionView)
                }else {
                    setEmptyMessage("Loading Data ...", collectionV: collectionView)
                }
            } else {
                restore(collectionV: collectionView)
            }
            return self.leagueTeamsList.count
        }else {
            return 0
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var w : Double = 0.0
        var h : Double = 0.0
        
        if collectionView == self.leagueTeams{
            w = 100.0
            h = Double(CGFloat(collectionView.bounds.size.width))
        }else if collectionView == self.leagueUpcomingEvents{
            w = Double(CGFloat(collectionView.bounds.size.width))
            h = Double(CGFloat(collectionView.bounds.size.height))
        }else if collectionView == self.leagueLatestEvents{
            w = Double(CGFloat(collectionView.bounds.size.width))
            h = Double(CGFloat(collectionView.bounds.size.height))
        }
        
        return CGSize(width: w, height: h)
        
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.leagueUpcomingEvents{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! UpcomingEventsCellController
            cell.eventName.text = leagueUpcomingEventsList[indexPath.row].strEvent
            cell.eventDate.text = leagueUpcomingEventsList[indexPath.row].dateEvent
            cell.eventTime.text = leagueUpcomingEventsList[indexPath.row].strTime
            cell.layer.cornerRadius = 20.0
            //cell.backgroundColor = UIColor.purple
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.masksToBounds = true
            cell.layer.borderWidth = 2
            let thumbImage = UIImageView()
            
            var myUrl : URL?
            if leagueUpcomingEventsList[indexPath.row].strThumb! != "" && leagueUpcomingEventsList[indexPath.row].strThumb! != nil {
                myUrl = Foundation.URL.init(string: leagueUpcomingEventsList[indexPath.row].strThumb!)
            }else{
                myUrl = Foundation.URL.init(string:"https://global-uploads.webflow.com/5e157548d6f7910beea4e2d6/610898130d049c02ee7a09e2_logo_2f117a78-b765-4e72-a215-0809c4a74bd6.png")
            }
            let resource = ImageResource(downloadURL: myUrl!)
            KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                switch result {
                case .success(let value):
                    thumbImage.image = value.image
                    cell.backgroundView = thumbImage
                case .failure( _):
                    thumbImage.image = UIImage(named:"sports.jpeg")
                }
            }
            return cell
        }else if collectionView == self.leagueLatestEvents{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! LatestResultsCellController
            cell.team1Score.text = leagueLatestEventsList[indexPath.row].intHomeScore
            cell.team2Score.text = leagueLatestEventsList[indexPath.row].intAwayScore
            cell.eventDate.text  = leagueLatestEventsList[indexPath.row].dateEvent
            cell.eventTime.text  = leagueLatestEventsList[indexPath.row].strTime
            
            cell.layer.cornerRadius = 20.0
            //cell.backgroundColor = UIColor.purple
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.masksToBounds = true
            cell.layer.borderWidth = 2
            let thumbImage = UIImageView()
            var myUrl : URL?
            if leagueLatestEventsList[indexPath.row].strThumb! != "" && leagueLatestEventsList[indexPath.row].strThumb! != nil {
                myUrl = Foundation.URL.init(string: leagueLatestEventsList[indexPath.row].strThumb!)
            }else{
                myUrl = Foundation.URL.init(string:"https://global-uploads.webflow.com/5e157548d6f7910beea4e2d6/610898130d049c02ee7a09e2_logo_2f117a78-b765-4e72-a215-0809c4a74bd6.png")
            }
            let resource = ImageResource(downloadURL: myUrl!)
            KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                switch result {
                case .success(let value):
                    thumbImage.image = value.image
                    cell.backgroundView = thumbImage
                case .failure( _):
                    thumbImage.image = UIImage(named:"sports.jpeg")
                }
            }
            
            return cell
        }else if collectionView == self.leagueTeams{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TeamsCellController
            let myUrl = Foundation.URL.init(string: leagueTeamsList[indexPath.row].strTeamBadge!)
            let resource = ImageResource(downloadURL: myUrl!)
            KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                switch result {
                case .success(let value):
                    cell.teamImage.image = value.image
                case .failure( _):
                    cell.teamImage.image = UIImage(named:"sports.jpeg")
                }
            }
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.leagueTeams{
            // switch to the team details
            print(leagueTeamsList[indexPath.row].strTeam!)
            //let teamDetailsVC = self.storyboard?.instantiateViewController(identifier: "TeamDetails") as! LeaguesViewController
            //teamDetailsVC.team = leagueTeamsList[indexPath.row]
            //self.present(teamDetailsVC, animated: true, completion: nil)
            
            let teamDetailsVC = self.storyboard?.instantiateViewController(identifier: "TeamDetails") as! TeamDetailsViewController
            teamDetailsVC.team = leagueTeamsList[indexPath.row]
            self.present(teamDetailsVC, animated: true, completion: nil)
        }
        
    }
    
     
    
    
}
