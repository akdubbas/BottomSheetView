//
//  TippingViewController.swift
//  BottomSheetsNew
//
//  Created by Dubbasi, Amith (NonEmp) on 7/16/18.
//  Copyright © 2018 Dubbasi, Amith (NonEmp). All rights reserved.
//

import Foundation
import UIKit

class TippingViewController :UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    var headerView : TippingHeaderView?
    
    let tipArray = ["None","5%","10%","15%","20%","Other amount"]
    
    let fullView: CGFloat = 100
    var partialView: CGFloat {
        return UIScreen.main.bounds.height - 150
    }
    
    lazy var myView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 10)
        return view
    }()
    
   
    
    override func viewDidLoad() {
        collectionView?.backgroundColor = .white
        collectionView?.register(TippingViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register( TippingFooterViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: headerId)
        collectionView?.register( TippingHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
        collectionView?.alwaysBounceVertical = false
        
        self.view.addSubview(myView)
        myView.anchor(top: self.view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 5)
        
        myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myView.layer.cornerRadius = 3
        
        headerView?.anchor(top: myView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(self.panGesture))
        panGesture.delegate = self
        view.addGestureRecognizer(panGesture)
        roundViews()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareBackgroundView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TippingViewCell
        
        cell.tipAmount.text = tipArray[indexPath.row]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Row selected")
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tipArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 75)
    }

    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
          switch kind {
        case UICollectionElementKindSectionHeader:
        
            headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! TippingHeaderView
            return headerView!
        
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! TippingFooterViewCell
            return footerView
          default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 45)
    }
    
    func roundViews() {
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
    }
    
    @objc  func panGesture(_ recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        let velocity = recognizer.velocity(in: self.view)
        
        let y = self.view.frame.minY
        if (y + translation.y >= fullView) && (y + translation.y <= partialView) {
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
                
            }, completion: { [weak self] _ in
                if ( velocity.y < 0 ) {
                    //self?.collectionView?.alwaysBounceVertical = true
                }
                else {
                    self?.collectionView?.alwaysBounceVertical = false
                }
            })
        }
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


extension TippingViewController: UIGestureRecognizerDelegate {
    
    // Solution
   /* func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let gesture = (gestureRecognizer as! UIPanGestureRecognizer)
        let direction = gesture.velocity(in: view).y
        
        let y = view.frame.minY
        
        if (y == fullView && self.collectionView?.contentOffset.y == 0 && direction > 0) || (y == partialView) {
            self.collectionView?.alwaysBounceVertical = true
        } else {
            self.collectionView?.alwaysBounceVertical = false
        }
        return false
    }*/
    
}

extension UIColor {
    static func rgb(red: CGFloat,  green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static func mainBlue() -> UIColor {
        return UIColor.rgb(red: 17, green: 154, blue: 237)
    }
    
}
