//
//  Movie+CoreDataProperties.swift
//  SeeMe
//
//  Created by Leandersson, Johan (Grey London) on 23/02/2016.
//  Copyright © 2016 Leandersson, Johan (Grey London). All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var desc: String?
    @NSManaged var image: NSData?
    @NSManaged var link: String?
    @NSManaged var title: String?
    @NSManaged var year: String?
    @NSManaged var rated: String?
    @NSManaged var director: String?
    @NSManaged var imdbRating: String?
    @NSManaged var genre: String?

}
