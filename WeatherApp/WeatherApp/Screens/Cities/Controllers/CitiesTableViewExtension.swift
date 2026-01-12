//
//  CitiesTableViewExtension.swift
//  WeatherApp
//
//  Created by Shameem on 10/1/26.
//

import Foundation
import UIKit

extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(CityTableViewCell.register(), forCellReuseIdentifier: CityTableViewCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell
        
        guard let cell = cell else {
            return UITableViewCell()
        }
        
        let city = viewModel.cityModels[indexPath.row]
        cell.propagateData(city)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("selected \(viewModel.cityModels[indexPath.row].name)")
        // You can navigate to weather details screen here if needed
    }
}
