//
//  titleSubBanner.swift
//  AppStore
//
//  Created by Abby Esteves on 02/03/2019.
//  Copyright © 2019 Abby Esteves. All rights reserved.
//

import UIKit

class TitleSubBanner : BaseCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    let borderView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Boarder(alpha: 1.0)
        return view
    }()
    let appId = "appId"
    let appList = Layout().collectionView(spacing : 0, direction : .horizontal)
    
    func setupView() {
        appList.backgroundColor = .clear
        appList.delegate = self
        appList.dataSource = self
        appList.showsHorizontalScrollIndicator = false
        //        appList.isPagingEnabled = true
        appList.register(TitleSubBannerCell.self, forCellWithReuseIdentifier: appId)
        // add to layout
        Layout().addToView(whereTo: self, addViews : [
            borderView,
            appList
            ])
    }
    
    func setupConstraints() {
        borderView.frame = CGRect(x: 20, y: 0, width: self.frame.width-40, height: 1)
        appList.frame = CGRect(x: 0, y: borderView.frame.maxY, width: self.frame.width, height: self.frame.height-borderView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appId, for: indexPath) as! TitleSubBannerCell
        //        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    override func setupViews() {
        super.setupViews()
        
        setupView()
        setupConstraints()
    }
}

class TitleSubBannerCell: BaseCell {
    let typeLabel = Layout().uiLabel(textColor : UIColor.Default(alpha: 1.0), font : UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont(name: "AppleSDGothicNeo-Bold", size: 13)!), alignment: .left)
    let nameLabel = Layout().uiLabel(textColor : UIColor.black, font : UIFontMetrics(forTextStyle: .headline).scaledFont(for: UIFont(name: "ArialMT", size: 20)!), alignment: .left)
    let subLabel = Layout().uiLabel(textColor : UIColor.gray, font : UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont(name: "ArialMT", size: 18)!), alignment: .left)
    let appBannerImage = Layout().uiImageView(bg : UIColor.Background(alpha: 1.0), image : "", tint : .clear, contentMode: .scaleToFill)
    
    func setupView() {
        typeLabel.text = "type label".uppercased()
        nameLabel.text = "Name of game"
        subLabel.text = "Subtext here"
        appBannerImage.layer.cornerRadius = 10
        // add to layout
        Layout().addToView(whereTo: self, addViews : [
            typeLabel,
            nameLabel,
            subLabel,
            appBannerImage
            ])
    }
    
    func setupConstraints(){
        typeLabel.frame = CGRect(x: 20, y: 10, width: frame.width-40, height: 15)
        nameLabel.frame = CGRect(x: 20, y: typeLabel.frame.maxY+2.5, width: frame.width-40, height: 25)
        subLabel.frame = CGRect(x: 20, y: nameLabel.frame.maxY+2.5, width: frame.width-40, height: 20)
        appBannerImage.frame = CGRect(x: 20, y: subLabel.frame.maxY+10, width: frame.width-40, height: frame.height-(typeLabel.frame.height+nameLabel.frame.height+subLabel.frame.height+40))
    }
    
    override func setupViews() {
        super.setupViews()
        
        setupView()
        setupConstraints()
    }
}
