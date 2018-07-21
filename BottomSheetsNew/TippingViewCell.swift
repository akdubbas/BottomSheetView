//
//  TippingViewCell.swift
//  BottomSheetsNew
//
//  Created by Dubbasi, Amith (NonEmp) on 7/16/18.
//  Copyright © 2018 Dubbasi, Amith (NonEmp). All rights reserved.
//

import Foundation
import UIKit

class TippingViewCell : UICollectionViewCell
{
    
    lazy var tipAmount : UILabel = {
        let label = UILabel()
        label.text = "Exhibit Name"
        label.numberOfLines = 0
        label.font  = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tipAmount)
        tipAmount.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        addSubview(separatorView)
        separatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    
    func anchor(top : NSLayoutYAxisAnchor?,left : NSLayoutXAxisAnchor?,bottom : NSLayoutYAxisAnchor?, right : NSLayoutXAxisAnchor?, paddingTop : CGFloat?,paddingLeft : CGFloat?,paddingBottom : CGFloat?, paddingRight : CGFloat?, width : CGFloat,height : CGFloat){
        
        //Applies to every constraint calling this function
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top, let paddingTop =  paddingTop{
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left, let paddingLeft = paddingLeft{
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right, let paddingRight = paddingRight {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        if let bottom = bottom, let paddingBottom = paddingBottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0{
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
}



