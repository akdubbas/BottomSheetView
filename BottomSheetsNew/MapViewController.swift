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
    
    lazy var enterTip1 : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Enter Tip1", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 0, green: 120, blue: 204)
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTip), for: .touchUpInside)
        return button
    }()
    
    lazy var enterTip2 : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Enter Tip2", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 0, green: 120, blue: 204)
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTip2), for: .touchUpInside)
        return button
    }()
    
    lazy var enterTip3 : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Enter Tip3", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 0, green: 120, blue: 204)
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTip3), for: .touchUpInside)
        return button
    }()
    
    @objc func handleTip()
    {
        addBottomSheetView()
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(enterTip1)
        self.view.addSubview(enterTip2)
        self.view.addSubview(enterTip3)
        
        enterTip1.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        enterTip1.centerYAnchor.constraint(equalTo:self.view.centerYAnchor).isActive = true
        enterTip1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        
       enterTip2.anchor(top: enterTip1.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        enterTip2.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        //enterTip2.centerYAnchor.constraint(equalTo:self.view.centerYAnchor).isActive = true
        enterTip2.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        
        enterTip3.anchor(top: enterTip2.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        enterTip3.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        //enterTip2.centerYAnchor.constraint(equalTo:self.view.centerYAnchor).isActive = true
        enterTip3.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        
        self.navigationController!.navigationBar.barTintColor  = UIColor.rgb(red: 0, green: 120, blue: 204)
        self.navigationItem.title = "Kroger"
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @objc func handleTip2()
    {
        let controller = PushController(collectionViewLayout: UICollectionViewFlowLayout())
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleTip3()
    {
        let controller = PresentController(collectionViewLayout: UICollectionViewFlowLayout())
        //self.navigationController?.pushViewController(controller, animated: true)
        let navCon = UINavigationController(rootViewController: controller)
        self.present(navCon, animated: true, completion: nil)
        
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
