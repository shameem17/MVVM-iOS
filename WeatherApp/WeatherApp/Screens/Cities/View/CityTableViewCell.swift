//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Shameem on 10/1/26.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    static let identifier = "CityTableViewCell"
    
    // IBOutlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var coordinatesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        self.selectionStyle = .none
        cityNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        stateLabel.font = UIFont.systemFont(ofSize: 14)
        stateLabel.textColor = .gray
        coordinatesLabel.font = UIFont.systemFont(ofSize: 12)
        coordinatesLabel.textColor = .lightGray
    }
    
    static func register() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func propagateData(_ city: CityModel) {
        cityNameLabel.text = city.name
        stateLabel.text = city.stateOrRegion
        coordinatesLabel.text = "Lat: \(String(format: "%.2f", city.latitude)), Lon: \(String(format: "%.2f", city.longitude))"
    }
}
