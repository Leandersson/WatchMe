//
//  SearchBar.swift
//  SeeMe
//
//  Created by Leandersson, Johan (Grey London) on 23/02/2016.
//  Copyright © 2016 Leandersson, Johan (Grey London). All rights reserved.
//

import UIKit

class SearchBar: UISearchBar {
    
    var preferredFont: UIFont!
    var preferredTextColor: UIColor!
    
    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)
        
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        
        searchBarStyle = UISearchBarStyle.Prominent
        translucent = false

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0] as! UIView
        
        for var i=0; i<searchBarView.subviews.count; ++i {
            if searchBarView.subviews[i].isKindOfClass(UITextField) {
                index = i
                break
            }
        }
        
        return index
    }
    
  

}
