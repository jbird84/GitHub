//
//  GHTitleLabel.swift
//  GitHub
//
//  Created by Kinney Kare on 2/8/20.
//  Copyright © 2020 Kinney Kare. All rights reserved.
//

import UIKit

class GHTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    
    private func configure() {
        //.label is dark on a white screen and light on a dark screen
        textColor = .label
        
        //this allows for the font to shrink
        adjustsFontSizeToFitWidth = true
        
        //this tells the font how much to shrink by
        minimumScaleFactor = 0.9
        
        //if lable is still too long this tells it where to break it off with three dots --> ...
        lineBreakMode = .byTruncatingTail
        
        //MUST SET THIS TO FAST TO USE AUTO LAYOUT
        translatesAutoresizingMaskIntoConstraints = false
    }
}
