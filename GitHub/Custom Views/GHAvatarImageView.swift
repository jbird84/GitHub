//
//  GHAvatarImageView.swift
//  GitHub
//
//  Created by Kinney Kare on 2/12/20.
//  Copyright © 2020 Kinney Kare. All rights reserved.
//

import UIKit

class GHAvatarImageView: UIImageView {

    let placeholderImage = UIImage(named: "avatar-placeholder")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        /*This is where we setup how we want the image to look.
        Below you will see we made the corners rounded */
        layer.cornerRadius = 10
        
        //now the above will create a circle for the layer where the picture is but if you want the picture itself a corner you must use clipToBounds as seen below.
        clipsToBounds = true
        
        //now we must set the image
        image = placeholderImage
        
        translatesAutoresizingMaskIntoConstraints = false 
    }

}
