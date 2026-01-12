//
//  WeatherController.swift
//  WeatherApp
//
//  Created by Shameem on 10/1/26.
//
import UIKit
import MapKit

final class WeatherController: UIViewController{
    
    let mapView = MKMapView()
    let viewModel = WeatherViewModel()
    
    lazy var weatherCard: WeatherCard = {
        let card = WeatherCard()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    var coordinate: (Double, Double) = (0.0,0.0)
    var city: City?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.binding()
        self.setupViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateMap()
        viewModel.getWeather(coordinate: coordinate)
        weatherCard.propagateData(city: self.city, weather: nil)
    }
    
    func updateMap(){
        let coordinate = CLLocationCoordinate2D(latitude: coordinate.0, longitude: coordinate.1)
        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000
        )
        mapView.setRegion(region, animated: true)
        
        // Remove old pins
        mapView.removeAnnotations(mapView.annotations)
        
        // Add new pin
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
    func setupViews(){
        mapView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        self.view.addSubview(weatherCard)
        NSLayoutConstraint.activate([
            weatherCard.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            weatherCard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            weatherCard.widthAnchor.constraint(equalToConstant: 220)
            
        ])
        self.view.bringSubviewToFront(weatherCard)
    }
    
    func binding(){
        viewModel.weather.binding { [weak self] weather in
            print("value changed in weather")
            self?.configWeather(weather: weather)
        }
    }
    
    func configWeather(weather: WeatherResponse?){
        self.weatherCard.propagateData(city: self.city, weather: weather)
    }
}
