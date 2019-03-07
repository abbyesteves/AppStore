//
//  OpenApp.swift
//  AppStore
//
//  Created by Abby Esteves on 07/03/2019.
//  Copyright © 2019 Abby Esteves. All rights reserved.
//

import UIKit

class OpenApp: UIViewController, UIGestureRecognizerDelegate {
    
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark))
    
    @objc func drag(recognizer: UIPanGestureRecognizer) {
        guard recognizer.view != nil else { return }
        let view = recognizer.view
        if recognizer.state == .began || recognizer.state == .changed {
            let translation = recognizer.translation(in: self.view)
            view?.center = CGPoint(x: (view?.center.x)!, y: (view?.center.y)! + translation.y)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            let x = (self.view.frame.width/2)-(((view?.frame.width)!-translation.y)/2)
            let y = (self.view.frame.height/2)-(((view?.frame.height)!-(translation.y*4))/2)
            print(" drag ", (view?.frame.width)!, self.view.frame.width)
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                if (view?.layer.cornerRadius)! <= CGFloat(10) {
                    view?.layer.cornerRadius = x/2
                }
//                if (self.view?.alpha)! <= CGFloat(1) {
//                    self.view?.alpha = x/2
//                }
                if (view?.frame.width)! >= self.view.frame.width-40 {
                    view?.frame = CGRect(x: x, y: y, width: (view?.frame.width)!-translation.y, height: (view?.frame.height)!-(translation.y*4))
                }
            }, completion: { (Bool) in })
        } else if recognizer.state == .ended {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view?.layer.cornerRadius = 0
                view?.frame = self.view.frame
            }, completion: { (Bool) in

            })
        }
    }
    
    func setupView() {}
    func setupConstraints() {}
    func setupGestures() {}
    
    func open(view: UIView) {
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(blurView)
            window.addSubview(view)
            
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(drag(recognizer: )))
            panGesture.delegate = self
            view.addGestureRecognizer(panGesture)
            
            blurView.alpha = 0
            blurView.frame = window.frame
            view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.height)
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blurView.alpha = 1
                view.layer.cornerRadius = 0
                view.frame = self.view.frame
            }, completion: { (Bool) in })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setupGestures()
    }
}
