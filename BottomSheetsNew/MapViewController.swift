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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addBottomSheetView()
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
        
        bottomSheetView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
}
