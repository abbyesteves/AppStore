//
//  HomeController.swift
//  AppStore
//
//  Created by Abby Esteves on 18/02/2019.
//  Copyright © 2019 Abby Esteves. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    let appId = "appId"
    let homeId = "homeId"
    let headerLabel = Layout().uiLabel(textColor : UIColor.black, font : UIFontMetrics(forTextStyle: .headline).scaledFont(for: UIFont(name: "Arial-BoldMT", size: 34)!), alignment: .left)
    let dateLabel = Layout().uiLabel(textColor : UIColor.gray, font : UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont(name: "AppleSDGothicNeo-Bold", size: 13)!), alignment: .left)
    let appList = Layout().collectionView(spacing : 20, direction : .vertical)
    var didScroll = true
    
    lazy var openApp : OpenApp = {
        let launcher = OpenApp()
        return launcher
    }()
    
    @objc func longPress(sender : UILongPressGestureRecognizer) {
        let mainView = getView(subViews: (sender.view?.subviews)!, tag: 1)
        if sender.state == .began || sender.state == .changed {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                mainView.bounds = CGRect(x: -5, y: -5, width: self.appList.frame.width-(40+10), height: (self.appList.frame.height/2)+(50-10))
//                self.tabBarController?.tabBar.frame = CGRect(x: (self.tabBarController?.tabBar.frame.minX)!, y: self.view.frame.height, width: (self.tabBarController?.tabBar.frame.width)!, height: (self.tabBarController?.tabBar.frame.height)!)
            }, completion: { (Bool) in
                
            })
        } else {
            openApp.open(view: mainView)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
//                if self.didScroll {
//                    mainView.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width-40, height: (self.appList.frame.height/2)+50)
//                }
//                sender.view?.layer.cornerRadius = 10
                //add
//                self.tabBarController?.tabBar.frame = CGRect(x: (self.tabBarController?.tabBar.frame.minX)!, y: self.view.frame.height-(self.tabBarController?.tabBar.frame.height)!, width: (self.tabBarController?.tabBar.frame.width)!, height: (self.tabBarController?.tabBar.frame.height)!)
                self.tabBarController?.tabBar.frame = CGRect(x: (self.tabBarController?.tabBar.frame.minX)!, y: self.view.frame.height, width: (self.tabBarController?.tabBar.frame.width)!, height: (self.tabBarController?.tabBar.frame.height)!)
            }, completion: { (Bool) in })
        }
    }
    
    func getWindow(){
        
    }
    
    func getView(subViews : [UIView], tag : Int) -> UIView {
        var viewReturn = UIView()
        for view in subViews {
            if view.tag == tag {
                viewReturn = view
            }
        }
        return viewReturn
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
        dateLabel.text = Service().dateFormat(date : "\(Date().timeIntervalSince1970)", format : "EEEE dd MMMM").uppercased()
        headerLabel.text = "Today"
        // property list view
        appList.backgroundColor = .clear
        appList.delegate = self
        appList.dataSource = self
        appList.showsHorizontalScrollIndicator = false
        appList.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        appList.register(UICollectionViewCell.self, forCellWithReuseIdentifier: appId)
        appList.register(HomeCell.self, forCellWithReuseIdentifier: homeId)
        // add to layout
        Layout().addToView(whereTo: self.view, addViews : [
            appList
        ])
    }
    
    func setupConstraints() {
        appList.frame = self.view.bounds
    }
    func setupGestures() {}
    
    func setupHeader(cell : UICollectionViewCell) -> UICollectionViewCell {
        cell.backgroundColor = .clear
        //
        Layout().addToView(whereTo: cell, addViews : [
            dateLabel,
            headerLabel
        ])
        //
        dateLabel.frame = CGRect(x: 0, y: 10, width: cell.frame.width, height: 20)
        headerLabel.frame = CGRect(x: 0, y: dateLabel.frame.maxY, width: cell.frame.width, height: 40)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appId, for: indexPath)
        if indexPath.item != 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeId, for: indexPath) as! HomeCell
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress))
            longPress.minimumPressDuration = 0.1
            cell.addGestureRecognizer(longPress)
            cell.isMultipleTouchEnabled = true
            cell.tag = indexPath.item
            cell.backgroundColor = .clear
//            cell.layer.cornerRadius = 10
            return cell//Layout().cellProperties(cell : cell)
        }
        return self.setupHeader(cell : cell)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(" touches Began ", touches.description)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(" touches Cancelled ",touches.description)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width-40, height: 70)
        }
        return CGSize(width: collectionView.frame.width, height: (collectionView.frame.height/2)+50)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView == appList {
//            self.didScroll = false
//            print(" did Scroll ", didScroll)
//        }
//    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(" scrollViewDidScroll ", scrollView.contentOffset)
//    }
//
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        print(" scrollViewDidEndDragging ", scrollView.contentOffset)
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == appList {
            self.didScroll = false
            print(" did end Scroll ", didScroll)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupGestures()
        
    }
}
