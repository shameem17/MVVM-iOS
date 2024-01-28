//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Shameem on 27/1/24.
//

import UIKit

class HomeViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //viewModel
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configure()
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

}
