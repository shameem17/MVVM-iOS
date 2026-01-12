//
//  HomeTableViewExtension.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func setupTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(HomeTableViewCell.register(), forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        
        guard let cell = cell else{
            return UITableViewCell()
        }
        
        let country = viewModel.homeCountryModel.value?[indexPath.row]
        cell.propagateData(country)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCountry = viewModel.homeCountryModel.value?[indexPath.row]
        print("selected \(selectedCountry?.cca2 ?? "")")
        
        // Get the country code and navigate to cities screen
        guard let countryCode =  viewModel.getCCA(country: selectedCountry) else{
            print("Country code or name not available")
            return
        }
        
        // Create and configure CitiesViewController
        let citiesVC = CityViewController.getCityVC(code: countryCode)
        self.navigationController?.pushViewController(citiesVC, animated: true)
    }
}
