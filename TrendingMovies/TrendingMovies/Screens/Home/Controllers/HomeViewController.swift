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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!    
    
    //viewModel
    let viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trending Movies"
        configure()
        bindingModel()
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
    
    func bindingModel(){
        viewModel.isLoading.binding {[weak self] isLoading in
            guard let isLoading = isLoading, let self = self else{
                return
            }
            DispatchQueue.main.async {
                if isLoading{
                    self.activityIndicator.startAnimating()
                }else{
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
   

}
