//
//  TippingHeaderViewCell.swift
//  BottomSheetsNew
//
//  Created by Dubbasi, Amith (NonEmp) on 7/16/18.
//  Copyright © 2018 Dubbasi, Amith (NonEmp). All rights reserved.
//

import Foundation
import UIKit

class TippingFooterViewCell :UICollectionViewCell {
    
    lazy var myButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save Tip", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 0, green: 120, blue: 204)
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        addSubview(separatorView)
        separatorView.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        
        addSubview(myButton)
        myButton.anchor(top: separatorView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom:0, paddingRight: 0, width: 300, height: 50)
        
        myButton.centerXAnchor.constraint(equalTo:centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
