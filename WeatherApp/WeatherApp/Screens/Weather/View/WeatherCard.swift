//
//  WeatherCard.swift
//  WeatherApp
//
//  Created by Shameem on 10/1/26.
//

import UIKit

final class WeatherCard: UIView{
    lazy var cityName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black.withAlphaComponent(0.9)
        return label
    }()

    lazy var countryName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black.withAlphaComponent(0.7)
        return label
    }()
    
    lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black.withAlphaComponent(0.7)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white.withAlphaComponent(0.22)
        self.layer.cornerRadius = 16
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addSubview(cityName)
        self.addSubview(countryName)
        self.addSubview(weatherLabel)
        NSLayoutConstraint.activate([
            cityName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            cityName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            cityName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
          
            countryName.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 4),
            countryName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            countryName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            weatherLabel.topAnchor.constraint(equalTo: countryName.bottomAnchor, constant: 4),
            weatherLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            weatherLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            weatherLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12 )
        ])

    }
    public func propagateData(city: City?,weather: WeatherResponse?){
        DispatchQueue.main.async {[weak self] in
            self?.cityName.text = city?.name ?? ""
            self?.countryName.text = city?.country?.name ?? ""
            self?.weatherLabel.text = ("\(weather?.current?.tempC ?? 0)°C" )
        }
       
    }
}
