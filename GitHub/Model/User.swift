//
//  User.swift
//  GitHub
//
//  Created by Kinney Kare on 2/9/20.
//  Copyright © 2020 Kinney Kare. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarURL: String
    let name: String?
    let location: String?
    let bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlURL: String
    let following: Int
    let followers: Int
    let createdAt: String 
}
