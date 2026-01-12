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
    
    @IBOutlet weak var searchBar: UITextField!
    //viewModel
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.tableView.backgroundColor = .white
        configure()
        binding()
        viewModel.getCountries()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    func configure(){
        self.searchBar.delegate = self
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
                }
            }
        }
        
        viewModel.homeCountryModel.binding { [weak self] countries in
            if countries != nil{
                self?.tableView.reloadData()
            }
        }
    }

}

extension HomeViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("search text: \(textField.text ?? "")")
        viewModel.searchForCountry(with: textField.text ?? "")
    }
}
