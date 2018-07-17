//
//  BottomViewController.swift
//  BottomSheetsNew
//
//  Created by Dubbasi, Amith (NonEmp) on 7/11/18.
//  Copyright © 2018 Dubbasi, Amith (NonEmp). All rights reserved.
//

import Foundation
import UIKit


class BottomViewController : UIViewController {
    
    @IBOutlet weak var holdView: UIView!
    @IBOutlet weak var left: UIButton!
    @IBOutlet weak var right: UIButton!
    
    let fullView: CGFloat = 100
    var partialView: CGFloat {
        return UIScreen.main.bounds.height - (left.frame.maxY + UIApplication.shared.statusBarFrame.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(self.panGesture))
        view.addGestureRecognizer(panGesture)
        roundViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareBackgroundView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Animate BottomSheet appearance
        UIView.animate(withDuration: 0.3) { [weak self] in 
            let frame = self?.view.frame
            let yComponent  = UIScreen.main.bounds.height - 200
            self?.view.frame = CGRect(x: 0, y: yComponent, width: (frame?.width)!, height: (frame?.height)!)
            
        }
    }
    
    @objc func panGesture(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let velocity = recognizer.velocity(in: self.view)
        let y = self.view.frame.minY
        if ( y + translation.y >= fullView) && (y + translation.y <= partialView ) {
            self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
        
        if recognizer.state == .ended {
            var duration =  velocity.y < 0 ? Double((y - fullView) / -velocity.y) : Double((partialView - y) / velocity.y )
            
            duration = duration > 1.3 ? 1 : duration
            
            UIView.animate(withDuration: duration, delay: 0.0, options: [.allowUserInteraction], animations: {
                if  velocity.y >= 0 {
                    self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: self.view.frame.height)
                } else {
                    self.view.frame = CGRect(x: 0, y: self.fullView, width: self.view.frame.width, height: self.view.frame.height)
                }
                
            }, completion: nil)
        }
    }
    
    func roundViews() {
        view.layer.cornerRadius = 5
        holdView.layer.cornerRadius = 3
        left.layer.cornerRadius = 10
        right.layer.cornerRadius = 10
        left.layer.borderColor = UIColor(displayP3Red: 0, green: 148/255, blue: 247/255, alpha: 1).cgColor//UIColor(colorLiteralRed: 0, green: 148/255, blue: 247.0/255.0, alpha: 1).cgColor
        left.layer.borderWidth = 1
        view.clipsToBounds = true
    }
    
    //Add blur and Vibrancy effects
    func prepareBackgroundView()
    {
        let blurEffect = UIBlurEffect.init(style : .dark)
        let visualEffect = UIVisualEffectView.init(effect: blurEffect)
        let bluredView = UIVisualEffectView.init(effect: blurEffect)
        bluredView.contentView.addSubview(visualEffect)
        
        visualEffect.frame = UIScreen.main.bounds
        self.view.insertSubview(bluredView, at: 0)
    }
}

