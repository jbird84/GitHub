//
//  GHContainerView.swift
//  GitHub
//
//  Created by Kinney Kare on 2/8/20.
//  Copyright © 2020 Kinney Kare. All rights reserved.
//

import UIKit

class GHContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        translatesAutoresizingMaskIntoConstraints = false 
    }
}
