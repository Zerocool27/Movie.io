//
//  MovieCell.swift
//  Movie.io
//
//  Created by fatih on 12/17/18.
//  Copyright © 2018 fatih. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    static var reuseIdentifier = "MovieCell"
    
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK: Setup Methods
extension MovieCell{
    //SET WITH MODEL
    func setupCellWith(model: Movie){
        
        self.movieName.text = model.movieName
        self.movieRating.text = String(format:"%f", model.movieRating ?? "no rating")

    }
}
