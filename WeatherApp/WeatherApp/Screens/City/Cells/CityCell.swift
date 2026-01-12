//
//  CityCell.swift
//  WeatherApp
//
//  Created by Shameem on 10/1/26.
//

import UIKit


final class CityCell: UITableViewCell{
    static let identifier = "CityCell"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.8)
        return label
    }()
    
    lazy var regionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black.withAlphaComponent(0.6)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
  
}

extension CityCell{
    private func setupViews(){
        self.addSubview(nameLabel)
        self.addSubview(regionLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            regionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            regionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            regionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
    public func propagateData(_ city: City?){
        guard city != nil else {
            return
        }
        DispatchQueue.main.async {[weak self] in
            self?.nameLabel.text = city?.name ?? ""
            self?.regionLabel.text = city?.stateOrRegion ?? ""
        }
    }
}

