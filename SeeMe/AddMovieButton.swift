//
//  AddMovieButton.swift
//  SeeMe
//
//  Created by Leandersson, Johan (Grey London) on 06/03/2016.
//  Copyright © 2016 Leandersson, Johan (Grey London). All rights reserved.
//

import UIKit

class AddMovieButton: UIButton {

    override func awakeFromNib() {
        let shadowColor: CGFloat = 0.0 / 255.0
        layer.cornerRadius = 10.0
        layer.shadowColor = UIColor(red: shadowColor, green: shadowColor, blue: shadowColor, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }

}
