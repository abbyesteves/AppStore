//
//  GamesController.swift
//  AppStore
//
//  Created by Abby Esteves on 18/02/2019.
//  Copyright © 2019 Abby Esteves. All rights reserved.
//

import UIKit

class GamesController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let appId = "appId"
    let titleSubBannerCellId = "titleSubBannerCellId"
    let getSmallId = "getId"
    let getMidId = "getId"
    let appList = Layout().collectionView(spacing : 1, direction : .vertical)
    
    func setupView() {
        view.backgroundColor = .white
        appList.backgroundColor = .clear
        appList.delegate = self
        appList.dataSource = self
        appList.showsHorizontalScrollIndicator = false
        appList.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        appList.register(TitleSubBanner.self, forCellWithReuseIdentifier: titleSubBannerCellId)
        appList.register(GetSmall.self, forCellWithReuseIdentifier: getSmallId)
        appList.register(UICollectionViewCell.self, forCellWithReuseIdentifier: appId)
        // add to layout
        Layout().addToView(whereTo: self.view, addViews : [
            appList
        ])
    }
    func setupConstraints() {
        appList.frame = self.view.bounds
    }
    func setupGestures() {}
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appId, for: indexPath)
        cell.backgroundColor = .red
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: titleSubBannerCellId, for: indexPath) as! TitleSubBanner
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: getSmallId, for: indexPath) as! GetSmall
            return cell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/3+30)
        }
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setupGestures()
    }
    
}
