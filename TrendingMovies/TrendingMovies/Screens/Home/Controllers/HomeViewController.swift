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
   
    func configure(){
        //self.title = "Trending Movie Lsit"
        self.view.backgroundColor = .systemIndigo
        tableViewSetup()
    }
    
    
    
   

}
