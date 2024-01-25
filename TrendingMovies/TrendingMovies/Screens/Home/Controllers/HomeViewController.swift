//
//  HomeViewController.swift
//  TrendingMovies
//
//  Created by Shameem on 24/1/24.
//

import UIKit

class HomeViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure(){
        self.title = "Trending Movie List"
        self.view.backgroundColor = .systemIndigo
        setupTable()
    }
    

}
