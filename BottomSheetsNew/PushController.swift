//
//  PushController.swift
//  BottomSheetsNew
//
//  Created by Dubbasi, Amith (NonEmp) on 7/19/18.
//  Copyright © 2018 Dubbasi, Amith (NonEmp). All rights reserved.
//

import Foundation
import UIKit

class PushController : UICollectionViewController,UICollectionViewDelegateFlowLayout {
    

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
    collectionView?.alwaysBounceVertical = true
    
    self.navigationController!.navigationBar.barTintColor  = UIColor.rgb(red: 0, green: 120, blue: 204)
    self.navigationItem.title = "Kroger"
    //let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    //navigationController?.navigationBar.titleTextAttributes = textAttributes
    
    self.navigationController?.navigationBar.tintColor = UIColor.white;

    self.view.addSubview(myView)
    myView.anchor(top: self.view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 5)
    
    myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    myView.layer.cornerRadius = 3
    
    headerView?.anchor(top: myView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
   
}

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

}

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
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
}




