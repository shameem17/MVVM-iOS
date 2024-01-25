//
//  DetailsViewController.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieDetails: DetailsMovieModel
    
    init(movieDetails: DetailsMovieModel) {
        self.movieDetails = movieDetails
        super.init(nibName: "DetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configure()
    }
    
    func configure(){
        self.title = movieDetails.title
        self.view.backgroundColor = .systemIndigo
        self.movieImage.setImage(with: movieDetails.imageUrl)
        self.movieTitle.text = movieDetails.title
        self.descriptionLabel.text = movieDetails.overView
    }



}
