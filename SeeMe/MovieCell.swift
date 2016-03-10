//
//  MovieCell.swift
//  SeeMe
//
//  Created by Leandersson, Johan (Grey London) on 15/02/2016.
//  Copyright © 2016 Leandersson, Johan (Grey London). All rights reserved.
//

import UIKit
import Foundation
import GPUImage

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieImage.clipsToBounds = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(movie: Movie) {
        movieTitle.text = movie.title
        
        let inputImage = movie.getMovieImg()
        
        let blurFilter = GPUImageGaussianBlurFilter()
        let monochrome = GPUImageGrayscaleFilter()
        let filterGroup = GPUImageFilterGroup()
        blurFilter.blurRadiusInPixels = 10
        
        filterGroup.addFilter(blurFilter)
        filterGroup.addFilter(monochrome)
        
        monochrome.addTarget(blurFilter)
        monochrome.useNextFrameForImageCapture()
        
        let outputImage = blurFilter.imageByFilteringImage(inputImage)
        
        movieImage.image = outputImage
        }
    
 
    

}
