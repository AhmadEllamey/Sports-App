//
//  SportsViewController.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/12/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import UIKit

class SportsViewController: UIViewController {

    @IBOutlet weak var allSports: UICollectionView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let myPresenter : SportsProtocol?
        myPresenter = SportsPresenter(viewRef:self , repoRef : Repo.getRepoInstance(netowrk: NetworkService.networkServiceIntanace))
        myPresenter?.getSports(link: "all_sports.php", params: nil)
        
        // Do any additional setup after loading the view.
        
        
        //NetworkService.networkServiceIntanace.getResultFromAPI(link: "all_sports.php", params: nil , type: Sports ){ (sports, error) in
        //guard let sports = sports else{
             
        //    return
        //}
        
        
        
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

extension SportsViewController : SportsViewProtocol{
    
    
    
    
    
    
    
}
