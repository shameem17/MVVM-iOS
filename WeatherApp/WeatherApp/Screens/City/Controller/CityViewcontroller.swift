//
//  Untitled.swift
//  WeatherApp
//
//  Created by Shameem on 10/1/26.
//
import UIKit

final class CityViewController: UIViewController {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        indicator.tintColor = .gray
        indicator.color = .gray
        return indicator
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        //tableView.allowsSelection = false
        return tableView
    }()
    
    let viewModel = CityViewModel()
    var countryCode: String = ""
    
    public static func getCityVC(code: String) -> CityViewController{
        let cityVC = CityViewController()
        cityVC.countryCode = code
        return cityVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.binding()
        viewModel.getCities(countryCode: countryCode)
        setupViews()
    }
    
    func binding(){
        viewModel.isLoading.binding { [weak self] isLoading in
            guard let isLoading = isLoading, let self = self else{
                return
            }
            DispatchQueue.main.async{
                if isLoading{
                    self.activityIndicator.startAnimating()
                    print("Waiting to be loaded")
                }else{
                    self.activityIndicator.stopAnimating()
                    print("Loding finished")
                }
            }
        }
        
        viewModel.cities.binding {[weak self] city in
            if city != nil{
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    func setupViews(){
        self.view.addSubview(tableView)
        self.view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        self.view.bringSubviewToFront(activityIndicator)
        self.setupTableView()
    }
}

extension CityViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cities.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.identifier, for: indexPath) as? CityCell else {
            return UITableViewCell()
        }
        cell.propagateData(viewModel.getCity(for: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCity = viewModel.getCity(for: indexPath.row)
        let weatherVc = WeatherController()
        weatherVc.coordinate = (selectedCity?.latitude ?? 0.0, selectedCity?.longitude ?? 0.0)
        weatherVc.city = selectedCity
        self.navigationController?.pushViewController(weatherVc, animated: true)
    }
    
    
    func setupTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(CityCell.self, forCellReuseIdentifier: CityCell.identifier)
    }
}
