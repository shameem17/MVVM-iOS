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
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.countries[indexPath.row].name.common
        
        return cell
    }
}
