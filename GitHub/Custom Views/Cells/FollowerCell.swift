//
//  FollowerCell.swift
//  GitHub
//
//  Created by Kinney Kare on 2/12/20.
//  Copyright © 2020 Kinney Kare. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GHAvatarImageView(frame: .zero)
    let usernameLabel = GHTitleLabel(textAlignment: .center, fontSize: 16)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
    }
    
    
    private func configure() {
            //DON'T forget to add subviews
            addSubview(avatarImageView)
            addSubview(usernameLabel)
            setupImageViewConstraints()
            setupUsernameLabelConstraints()
    }
    
    
    private func setupImageViewConstraints() {
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            //all cells have a contentView
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            //Remember trailing needs to be a negative number.
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            //now we want our picture to be a square so we need to set the height equal to the width.
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        ])
    }
    
    
    private func setupUsernameLabelConstraints() {
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
