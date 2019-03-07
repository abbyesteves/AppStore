//
//  Extension.swift
//  AppStore
//
//  Created by Abby Esteves on 18/02/2019.
//  Copyright © 2019 Abby Esteves. All rights reserved.
//

import UIKit

extension UIColor{
    static func Background(alpha: CGFloat) -> UIColor {
        return UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: alpha)
    }
    
    static func Default(alpha: CGFloat) -> UIColor {
        return UIColor(red: 63/255, green: 153/255, blue: 250/255, alpha: alpha)
    }
    
    static func Boarder(alpha: CGFloat) -> UIColor {
        return UIColor(red: 230/255, green: 236/255, blue: 240/255, alpha: alpha)
    }
}

class Layout {
    let navbarStatusHeight = UIApplication.shared.statusBarFrame.height
    let bottomSpacing = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
    let navBarHeight = UINavigationController.init().navigationBar.frame.height
    let tabBarHeight = UITabBarController.init().tabBar.frame.height
    
    func uiLabel(textColor : UIColor, font: UIFont, alignment : NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.font = font
        label.textAlignment = alignment
        label.numberOfLines = 2
        return label
    }
    
    func collectionView(spacing : CGFloat, direction : UICollectionView.ScrollDirection) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = direction
        layout.minimumLineSpacing = spacing
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }
    
    func uiImageView(bg : UIColor, image : String, tint : UIColor, contentMode: UIView.ContentMode) -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = bg
        imageView.contentMode = contentMode
        imageView.tintColor = tint
        imageView.image = UIImage(named : image)
        imageView.clipsToBounds = true
        if tint != .clear {
            imageView.image = UIImage(named : image)?.withRenderingMode(.alwaysTemplate)
        }
        return imageView
    }
    
    func cellProperties(cell : UICollectionViewCell) -> UICollectionViewCell{
        cell.backgroundColor = .white
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
        cell.layer.shadowRadius = 3
        return cell
    }
    
    func addToView(whereTo: Optional<UIView>, addViews : [Optional<UIView>]) {
        for addView in addViews {
            whereTo!.addSubview(addView!)
        }
    }
}
