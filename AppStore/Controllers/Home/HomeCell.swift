//
//  HomeCell.swift
//  AppStore
//
//  Created by Abby Esteves on 18/02/2019.
//  Copyright © 2019 Abby Esteves. All rights reserved.
//

import UIKit
class HomeCell : BaseCell {
    
    let appBannerImage = Layout().uiImageView(bg : UIColor.Background(alpha: 1.0), image : "", tint : .clear, contentMode: .scaleToFill)
    let mainView : UIView = {
        let view = UIView()
//        view.backgroundColor = .red
        view.tag = 1
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 3
        return view
    }()
    func setupView(){
        appBannerImage.layer.cornerRadius = 10
        appBannerImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        //
        Layout().addToView(whereTo: self, addViews : [
            mainView
        ])
    }
    func setupConstraints(){
        mainView.frame = CGRect(x: 20, y: 0, width: frame.width-40, height: frame.height-3)
//        appBannerImage.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height-70)
    }
    
    override func setupViews() {
        super.setupViews()
        
        setupView()
        setupConstraints()
    }
}
