//
//  MapViewController.swift
//  BottomSheetsNew
//
//  Created by Dubbasi, Amith (NonEmp) on 7/11/18.
//  Copyright © 2018 Dubbasi, Amith (NonEmp). All rights reserved.
//

import Foundation
import UIKit


class MapViewController : UIViewController {
    
    lazy var enterTip : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Enter Tip", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 0, green: 120, blue: 204)
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTip), for: .touchUpInside)
        return button
    }()
    
    @objc func handleTip()
    {
        addBottomSheetView()
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(enterTip)
        
        enterTip.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        enterTip.centerYAnchor.constraint(equalTo:self.view.centerYAnchor).isActive = true
        enterTip.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func addBottomSheetView()
    {
        //let bottomSheetView = TippingViewController(collectionViewLayout: UICollectionViewFlowLayout())//BottomViewController()
        let bottomSheetView = ScrollableBottomSheetViewController()
        self.addChildViewController(bottomSheetView)
        self.view.addSubview(bottomSheetView.view)
        bottomSheetView.didMove(toParentViewController: self)
        
        //Adjust bottom sheet frame and initial position
        let height  = self.view.frame.height
        let width = self.view.frame.width
        
       // bottomSheetView.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: width, height: height)
        bottomSheetView.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: width, height: height)
    }
    
}
