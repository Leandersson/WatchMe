//
//  addMovieVC.swift
//  SeeMe
//
//  Created by Leandersson, Johan (Grey London) on 15/02/2016.
//  Copyright © 2016 Leandersson, Johan (Grey London). All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import SwiftyJSON

class addMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UISearchBarDelegate {


    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var imagePicker: UIImagePickerController!
    var imdbRating = ""
    var movieYear = ""
    var movieRating = ""
    var movieDirector = ""
    var movieDesc = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = 5.0
        movieImg.clipsToBounds = true
        movieTitle.text = ""
        
        self.movieImg.layer.cornerRadius = movieImg.frame.size.width / 2
        self.movieImg.clipsToBounds = true
        
    }


    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
    

    
    @IBAction func addImg(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addMovie(sender: AnyObject){
        if let title = movieTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            movie.title = title
            movie.desc = movieDesc
            movie.setMovieImage(movieImg.image!)
            movie.imdbRating = imdbRating
            movie.year = movieYear
            movie.rated = movieRating
            movie.director = movieDirector
            
            
            context.insertObject(movie)
            
                do {
                    try context.save()
                } catch {
                    print("Could not save movie")
                }
            
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func dismiss(sender: AnyObject){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        movieTitle.resignFirstResponder()
        return true
    }
    
    func searchIMDB(){
        
        if let search = searchBar.text {
            
            let spaceless = search.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            let url = NSURL(string: "http://www.omdbapi.com/?t=\(spaceless)&y=&plot=short&r=json")!
            
            Alamofire.request(.GET, url).responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
                let result = response.result
                if let JSON = result.value as? Dictionary<String, String> {
                    
                    if let title = JSON["Title"] {
                        self.movieTitle.text = title.uppercaseString
                    }
                    
                    if let desc = JSON["Plot"] {
                        self.movieDesc = desc
                    }
                    
                    if let imdb = JSON["imdbRating"] {
                        self.imdbRating = imdb
                    }
                    
                    if let year = JSON["Year"] {
                        self.movieYear = year
                    }
                    
                    if let dir = JSON["Director"] {
                        self.movieDirector = dir
                    }
                    
                    if let rate = JSON["Rated"] {
                        self.movieRating = rate
                    }
                    
                    if let image = JSON["Poster"] {
                        
                        if image != "N/A"{
                            let url = NSURL(string: image)!
                            let data = NSData(contentsOfURL: url)!
                            let moviePoster = UIImage(data: data)
                            self.movieImg.image = moviePoster
                        } else {
                            self.movieImg.image = UIImage(named: "noposter")
                        }
                        
                    }
                    
                }
            })
            
        }
        
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchIMDB()
        searchBar.resignFirstResponder()
        searchBar.text = ""
        
    }
    
    
    func userTappedInView(recognizer: UITapGestureRecognizer)
    {
        
        self.searchBar.resignFirstResponder()
        
    }
    
    
   
    
    
    



}
