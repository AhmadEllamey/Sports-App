//
//  LogoAnimationView.swift
//  Sports-App
//
//  Created by Marwan Adel on 5/22/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import UIKit
import SwiftyGif

class LogoAnimationView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        firstInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        firstInit()
    }
    
    
    private func firstInit() {
        do {
            let image = try UIImage(gifName: "gify.gif")
            let logoGifImageView = UIImageView(gifImage: image, loopCount: 1)
            backgroundColor = UIColor(white: 246.0 / 255.0, alpha: 1)
            addSubview(logoGifImageView)
            logoGifImageView.translatesAutoresizingMaskIntoConstraints = false
            logoGifImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            logoGifImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            logoGifImageView.widthAnchor.constraint(equalToConstant: 280).isActive = true
            logoGifImageView.heightAnchor.constraint(equalToConstant: 108).isActive = true
        } catch{
            print(error)
        }
    }
}
