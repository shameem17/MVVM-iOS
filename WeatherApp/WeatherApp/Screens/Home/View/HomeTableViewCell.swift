//
//  HomeTableViewCell.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    //IBOutlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLable: UILabel!
    @IBOutlet weak var latlongLabel: UILabel!
    @IBAction func seeCities(_ sender: Any) {
        print("clicked")
    }
    
    public static let identifier: String = "HomeTableViewCell"
    
    public static func register() -> UINib{
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
       // propagateData(_ country: Coun)
    }
    func setupCell(){
        self.imageLabel.round(7)
        self.backView.round(10)
        self.backView.border(color: .systemMint, width: 1)
    }
    
    func propagateData(_ country: HomeCountryModel){
        self.imageLabel.setImage(with: country.flags.png)
        self.nameLabel.text = country.name.common
        self.capitalLable.text = country.capital
        self.latlongLabel.text = country.latlng
        
    }
    
}
