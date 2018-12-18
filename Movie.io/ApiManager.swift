//
//  ApiManager.swift
//  Movie.io
//
//  Created by fatih on 12/17/18.
//  Copyright © 2018 fatih. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ApiManager: NSObject{
    
    static var shared = ApiManager()
    
}


//MARK: API Methods
extension ApiManager{
    
    
    func getAllMovies(completion: @escaping (_ result: [Movie]) -> Void){
        
        let fullRequestString = baseUrl + getMovies + "?api_key=" + apiKey
        
        let params : [String:Any] = [
            "language":"en-US",
            "page": 1
        ]
        
        
        //Alamofire.request(.GET, fullRequestString, parameters: params).responseJSON { (responseObject) -> Void in
        Alamofire.request(fullRequestString, method: .get,parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
            //print(response)
                switch response.result {
                case .success(let data):
                    let responseJson = data as! [String:Any]
                    if let results = responseJson["results"] as? [[String:Any]]{
                        let movieList = Mapper<Movie>().mapArray(JSONArray: results)
                        completion(movieList)
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
        }
        
    }
    
}
