//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Shameem on 27/1/24.
//

import UIKit

class HomeViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    //viewModel
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configure()
        binding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getCountries()
        self.tableView.reloadData()
    }
    func configure(){
        self.view.backgroundColor = .systemBlue
        setupTableView()
    }
    
    func binding(){
        viewModel.isLoading.binding { [weak self] isLoading in
            guard let isLoading = isLoading, let self = self else{
                return
            }
            DispatchQueue.main.async{
                if isLoading{
                    self.activityIndicator.startAnimating()
                    print("Waiting to be loaded")
                }else{
                    self.activityIndicator.stopAnimating()
                    print("Loding finished")
                    self.tableView.reloadData()
                }
            }
        }
    }

}
