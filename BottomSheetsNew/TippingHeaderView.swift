//
//  TippingHeaderView.swift
//  BottomSheetsNew
//
//  Created by Dubbasi, Amith (NonEmp) on 7/16/18.
//  Copyright © 2018 Dubbasi, Amith (NonEmp). All rights reserved.
//

import Foundation
import UIKit

class TippingHeaderView : UICollectionViewCell
{
    var selectTipAmount : String = "Select Tip Amount"
    var tip1 : String = "100% of tips go to your delivery person"
    var tip2 : String = "Tips are always optional"
    var tip3 : String = "You can change your tip after your delivery"
    
    lazy var selectTip: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: selectTipAmount+"\n", attributes:[NSAttributedStringKey.foregroundColor :UIColor.black,NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 24)])
        label.attributedText = attributedText
        return label
    }()
    
    
    
    lazy var tip1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: tip1+"\n", attributes:[NSAttributedStringKey.foregroundColor :UIColor.lightGray,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)])
        label.attributedText = attributedText
        return label
    }()
    
    lazy var tip2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: tip2+"\n", attributes:[NSAttributedStringKey.foregroundColor :UIColor.lightGray,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)])
        label.attributedText = attributedText
        return label
    }()
    lazy var tip3Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: tip3+"\n", attributes:[NSAttributedStringKey.foregroundColor :UIColor.lightGray,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)])
        label.attributedText = attributedText
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(selectTip)
        addSubview(tip1Label)
        addSubview(tip2Label)
        addSubview(tip3Label)
        
        selectTip.anchor(top: topAnchor, left: leftAnchor, bottom: tip1Label.topAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom:0, paddingRight: -5, width: 0, height: 0)
        tip1Label.anchor(top: selectTip.bottomAnchor, left: leftAnchor, bottom: tip2Label.topAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 15, paddingBottom:0, paddingRight: -5, width: 0, height: 0)
        tip2Label.anchor(top: tip1Label.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 2, paddingLeft: 15, paddingBottom:0, paddingRight: -5, width: 0, height: 0)
        tip3Label.anchor(top: tip2Label.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 2, paddingLeft: 15, paddingBottom:0, paddingRight: -5, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
