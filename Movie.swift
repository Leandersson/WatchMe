//
//  Movie.swift
//  SeeMe
//
//  Created by Leandersson, Johan (Grey London) on 15/02/2016.
//  Copyright © 2016 Leandersson, Johan (Grey London). All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

    func setMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImg() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
    
    
    
}
