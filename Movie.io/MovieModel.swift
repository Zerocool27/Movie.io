//
//  MovieModel.swift
//  Movie.io
//
//  Created by fatih on 12/17/18.
//  Copyright © 2018 fatih. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable {
    var movieName: String?
    var movieRating: Double?
    var moviePoster: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        movieName    <- map["title"]
        moviePoster         <- map["poster_path"]
        movieRating         <- map["popularity"]
       
    }
}
