//
//  SportsViewController.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/12/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import UIKit
import Kingfisher

class SportsViewController: UIViewController {
    
    @IBOutlet weak var allSports: UICollectionView!
    
    var list = [Sports]()
    var selectedSportName : String!
    
    var leagueScreen  : LeaguesViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allSports.dataSource = self
        allSports.delegate = self
        
        if Reachability.isConnectedToNetwork(){
            // request the list of sports
            let myPresenter : SportsProtocol?
            myPresenter = SportsPresenter(viewRef:self , repoRef : Repo.getRepoInstance(netowrk: NetworkService.networkServiceIntanace, coreData: CoreDataService.coreDataServiceIntanace))
            myPresenter?.getSports(link: "all_sports.php", params: nil)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        leagueScreen = segue.destination as? LeaguesViewController
    }
}

extension SportsViewController : SportsViewProtocol {
    
    func refreshSports(list : [Sports]){
        self.list = list
        allSports.reloadData()
    }
}

extension SportsViewController  : UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource, UICollectionViewDelegate{
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
        // request the list of sports
        let myPresenter : SportsProtocol?
        myPresenter = SportsPresenter(viewRef:self , repoRef : Repo.getRepoInstance(netowrk: NetworkService.networkServiceIntanace, coreData: CoreDataService.coreDataServiceIntanace))
        myPresenter?.getSports(link: "all_sports.php", params: nil)
    }
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        messageLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(SportsViewController.tapFunction))
        messageLabel.addGestureRecognizer(tap)
        self.allSports.backgroundView = messageLabel;
    }
    
    func restore() {
        self.allSports.backgroundView = nil
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if (self.list.count == 0) {
            if !Reachability.isConnectedToNetwork(){
                setEmptyMessage("No Internet Connection ... \n click to re-try")
            }else {
                setEmptyMessage("Loading Data ...")
            }
        } else {
            restore()
        }
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 2
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        return CGSize(width: size, height: size)
    }
    
    
    /*
     func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
     let screenSize: CGRect = UIScreen.main.bounds
     let screenWidth = screenSize.width
     return CGSize(width: (screenWidth/2)-2, height: (screenWidth/2)-2);
     }
     */
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SportsCollectionViewCell
        // Configure the cell
        cell.sportName.text = list[indexPath.row].strSport
        let myUrl = Foundation.URL.init(string: list[indexPath.row].strSportThumb)
        let resource = ImageResource(downloadURL: myUrl!)
        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                cell.sportImage.image = value.image
            case .failure( _):
                cell.sportImage.image = UIImage(named:"sports.jpeg")
            }
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(list[indexPath.row].strSport)
        self.selectedSportName = list[indexPath.row].strSport
        
        leagueScreen?.sport = selectedSportName
    }
}
