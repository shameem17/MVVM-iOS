//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by Shameem on 10/1/26.
//

import UIKit

class CitiesViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    // ViewModel
    var viewModel = CitiesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        binding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // API call will be made when navigating to this screen with country code
    }
    
    func configure() {
        self.view.backgroundColor = .systemBackground
        self.title = viewModel.countryName
        setupTableView()
    }
    
    func binding() {
        viewModel.isLoading.binding { [weak self] isLoading in
            guard let isLoading = isLoading, let self = self else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                    print("Loading cities...")
                } else {
                    self.activityIndicator.stopAnimating()
                    print("Loading finished")
                    self.tableView.reloadData()
                }
            }
        }
    }
}
