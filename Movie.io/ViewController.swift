//
//  ViewController.swift
//  Movie.io
//
//  Created by fatih on 12/17/18.
//  Copyright © 2018 fatih. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var movieTableView: UITableView!
    var movieList = [Movie]()
    let cellHight:CGFloat = 75
}

//MARK: Override Methods
extension ViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

//MARK: Setup Methods
extension ViewController{
    
    func setupView(){
        setupTableView()
        
        
    }
    
    func setupTableView(){
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: MovieCell.reuseIdentifier)
        getAllMovies()
    }
}

//MARK: Tableview Delegate
extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHight
    }
}

//MARK: Tableview Datasource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier, for: indexPath) as! MovieCell
        cell.setupCellWith(model: self.movieList[indexPath.row])
        return cell
    }
    
}

//MARK: API Calls
extension ViewController{
    
    func getAllMovies(){
        ApiManager.shared.getAllMovies { (response) in
            
            self.movieList = response
            self.movieTableView.reloadData()
            print("MOVIE STRING RESPONSE",self.movieList.first?.movieRating)
        }
    }
    
}
