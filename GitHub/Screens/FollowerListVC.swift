//
//  FollowerListVC.swift
//  GitHub
//
//  Created by Kinney Kare on 2/4/20.
//  Copyright © 2020 Kinney Kare. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        getFollowers()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: username, page: 1) { (result) in
            
            switch result {
            case .success(let followers):
                print("Folloers.count = \(followers.count)")
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad things happened", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    
    func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        //the total width of the screen is view.bounds.width
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    
    func configureCollectionView() {
        //before you can use the object you MUST initialize it. below you will see the collectionView is set before we could addSubview.
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID) //you can access .reuseID because it was set to static.
    }
}
