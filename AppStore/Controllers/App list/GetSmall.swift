//
//  GetSmall.swift
//  AppStore
//
//  Created by Abby Esteves on 02/03/2019.
//  Copyright © 2019 Abby Esteves. All rights reserved.
//

import UIKit
class GetSmall : BaseCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let appId = "appId"
    let appList = Layout().collectionView(spacing : 10, direction : .horizontal)
    let headerLabel = Layout().uiLabel(textColor : UIColor.black, font : UIFontMetrics(forTextStyle: .headline).scaledFont(for: UIFont(name: "Arial-BoldMT", size: 20)!), alignment: .left)
    let borderView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Boarder(alpha: 1.0)
        return view
    }()
    let seeAllButton : UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont(name: "ArialMT", size: 15)!)
        button.setTitleColor(UIColor.Default(alpha: 1.0), for: .normal)
        button.setTitle("See All".capitalized, for: .normal)
        button.adjustsImageWhenHighlighted = true
        return button
    }()
    
    func setupView() {
        headerLabel.text = "new game we love".capitalized
        appList.backgroundColor = .clear
        appList.delegate = self
        appList.dataSource = self
        appList.showsHorizontalScrollIndicator = false
        //        appList.isPagingEnabled = true
        appList.register(getSmallCell.self, forCellWithReuseIdentifier: appId)
        // add to layout
        Layout().addToView(whereTo: self, addViews : [
            borderView,
            headerLabel,
            seeAllButton,
            appList
            ])
    }
    
    func setupConstraints() {
        borderView.frame = CGRect(x: 20, y: 0, width:  self.frame.width-40, height: 1)
        headerLabel.frame = CGRect(x: 20, y: borderView.frame.maxY+10, width: self.frame.width-(40+50), height: 25)
        seeAllButton.frame = CGRect(x: headerLabel.frame.maxX, y: headerLabel.frame.minY, width: 50, height: headerLabel.frame.height)
        appList.frame = CGRect(x: 0, y: headerLabel.frame.maxY, width: self.frame.width, height: self.frame.height-(headerLabel.frame.height+borderView.frame.height+20))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appId, for: indexPath) as! getSmallCell
        //        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: (collectionView.frame.height/3)-7)
    }
    
    override func setupViews() {
        super.setupViews()
        
        setupView()
        setupConstraints()
    }
}

class getSmallCell: BaseCell {
    let nameLabel = Layout().uiLabel(textColor : UIColor.black, font : UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont(name: "ArialMT", size: 15)!), alignment: .left)
    let subLabel = Layout().uiLabel(textColor : UIColor.gray, font : UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont(name: "ArialMT", size: 15)!), alignment: .left)
    let appBannerImage = Layout().uiImageView(bg : UIColor.Background(alpha: 1.0), image : "", tint : .clear, contentMode: .scaleToFill)
    let getButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.Background(alpha: 1.0)
        button.titleLabel?.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont(name: "Arial-BoldMT", size: 15)!)
        button.setTitleColor(UIColor.Default(alpha: 1.0), for: .normal)
        button.setTitle("get".uppercased(), for: .normal)
        button.adjustsImageWhenHighlighted = true
        return button
    }()
    let purchaseLabel = Layout().uiLabel(textColor : UIColor.lightGray, font : UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont(name: "ArialMT", size: 10)!), alignment: .left)
    
    func setupView(){
        purchaseLabel.text = "In-App Purchase"
        nameLabel.text = "App Name"
        subLabel.text = "subtext app here"
        appBannerImage.layer.cornerRadius = 10
        getButton.layer.cornerRadius = (self.frame.height-40)/2
        // add to layout
        Layout().addToView(whereTo: self, addViews : [
            appBannerImage,
            nameLabel,
            subLabel,
            getButton,
            purchaseLabel
            ])
    }
    func setupConstraints(){
        appBannerImage.frame = CGRect(x: 20, y: 10, width: self.frame.height-20, height: self.frame.height-20)
        nameLabel.frame = CGRect(x: appBannerImage.frame.maxX+10, y: 20, width: self.frame.width-(appBannerImage.frame.width+50+80), height: (self.frame.height/2)-20)
        subLabel.frame = CGRect(x: nameLabel.frame.minX, y: nameLabel.frame.maxY, width: nameLabel.frame.width, height: nameLabel.frame.height)
        getButton.frame = CGRect(x: nameLabel.frame.maxX, y: 10, width: 80, height: self.frame.height-40)
        purchaseLabel.frame = CGRect(x: getButton.frame.minX, y: getButton.frame.maxY+5, width: getButton.frame.width, height: 10)
    }
    override func setupViews() {
        super.setupViews()
        
        setupView()
        setupConstraints()
    }
}

