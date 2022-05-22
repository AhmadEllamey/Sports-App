//
//  LaunchViewController.swift
//  Sports-App
//
//  Created by Marwan Adel on 5/22/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import UIKit
import SwiftyGif

class LaunchViewController: UIViewController {
    //let logoAnimationView = LogoAnimationView()
    var logoGifImageView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            let image = try UIImage(gifName: "gify.gif")
            let logoGifImageView = UIImageView(gifImage: image, loopCount: 1)
            logoGifImageView.frame = view.bounds
            view.addSubview(logoGifImageView)
            logoGifImageView.delegate = self
        }catch{
            print(error)
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

extension LaunchViewController: SwiftyGifDelegate{
    
}
