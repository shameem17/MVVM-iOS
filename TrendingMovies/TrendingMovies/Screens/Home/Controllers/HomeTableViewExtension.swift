//
//  HomeTableViewExtension.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableViewSetup(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(HomeTableViewCell.register(), forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        guard let cell = cell else{
            return UITableViewCell()
        }
        let movie = viewModel.homeTableViewMovie[indexPath.row]
        //print(movie.title)
        cell.setupCell(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(viewModel.homeTableViewMovie[indexPath.row].title)")
        let selected = viewModel.homeTableViewMovie[indexPath.row]
        self.openDetails(for: selected)
        
    }
    
    
}
