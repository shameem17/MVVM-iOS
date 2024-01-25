//
//  HomeViewController.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //viewModel
    let viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trending Movies"
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.viewModel.getMovieList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.getMovieList()
    }
   
    func configure(){
        //self.title = "Trending Movie Lsit"
        self.view.backgroundColor = .systemIndigo
        tableViewSetup()
        self.tableView.reloadData()
    }
    
    
    
   

}
