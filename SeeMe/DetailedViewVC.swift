//
//  DetailedViewVC.swift
//  SeeMe
//
//  Created by Leandersson, Johan (Grey London) on 16/02/2016.
//  Copyright © 2016 Leandersson, Johan (Grey London). All rights reserved.
//

import UIKit
import CoreData
import Spring
import UICountingLabel

class DetailedViewVC: UIViewController {
    
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var viewBg: UIImageView!
    @IBOutlet weak var movieImdb: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewBg.image = movie?.getMovieImg()
        self.movieImg.image = movie?.getMovieImg()
        self.movieImg.layer.cornerRadius = movieImg.frame.size.width / 2
        self.movieImg.clipsToBounds = true
        self.movieImg.layer.borderWidth = 5
        self.movieImg.layer.borderColor = UIColor.whiteColor().CGColor
        self.movieImg.layer.shadowColor = UIColor(red: 157.0 / 255.0, green: 157.0 / 255.0, blue: 157.0 / 255.0, alpha: 0.5).CGColor
        self.movieImg.layer.shadowOpacity = 0.8
        self.movieImg.layer.shadowRadius = 5.0
        self.movieImg.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        
        
        if let dir = movie?.director  {
            self.movieDirector.text = dir
        } else {
            self.movieDirector.text = "N/A"
        }
        
        if let rate = movie?.rated {
            self.movieRating.text = rate
        } else {
            self.movieRating.text = "N/A"
        }
        
        if let year = movie?.year {
            self.movieYear.text = year
        } else {
            self.movieYear.text = "N/A"
        }
        
        if let desc = movie?.desc {
            self.movieDesc.text = desc
        }else {
            self.movieDesc.text = "N/A"
        }
        
        if let imdb = movie?.imdbRating {
            self.movieImdb.text = imdb
        } else {
            self.movieImdb.text = "N/A"
        }
        
        
        blurCI()
        
     }
    

    func blurCI() {
        let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = self.view.frame
        viewBg.addSubview(blurView)
    }
    
    @IBAction func dismiss(sender: AnyObject){
        dismissViewControllerAnimated(true, completion: nil)
    }

    

}
