//
//  HomeView.swift
//  WeatherAppViewcode
//
//  Created by Thyago Raphael on 28/04/22.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - UI Configuration
    enum Configuration {
        static let widthButton: CGFloat = 40
        static let heightButton: CGFloat = 40
        static let widthImage: CGFloat = 120
        static let heightImage: CGFloat = 120
    }
    
    private func makeTemperatureText(with temperature: String) -> NSAttributedString {
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.foregroundColor] = UIColor.label
        boldTextAttributes[.font] = UIFont.boldSystemFont(ofSize: 100)
        
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.systemFont(ofSize: 80)
        
        let text = NSMutableAttributedString(string: temperature, attributes: boldTextAttributes)
        text.append(NSAttributedString(string: "ºC", attributes: plainTextAttributes))
        
        return text
    }
    
    // MARK: - UI Components
    private lazy var backgroundView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "day-background")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    // Search
    private lazy var searchStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.addArrangedSubview(locationButton)
        stackView.addArrangedSubview(searchTextField)
        stackView.addArrangedSubview(searchButton)
        
        return stackView
    }()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.tintColor = .label
        
        return button
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .label
        
        return button
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.preferredFont(forTextStyle: .title1)
        textField.placeholder = "Search"
        textField.textAlignment = .right
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemFill
        
        return textField
    }()
    
    // Weather
    private lazy var temperatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 10
        stackView.addArrangedSubview(conditionImageView)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(cityLabel)
        
        return stackView
    }()
    
    private lazy var conditionImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "sun.max")
        image.tintColor = .label
        
        return image
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 80)
        label.attributedText = makeTemperatureText(with: "21.4")
        
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "Cupertino"
        
        return label
    }()
    
    // Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewcode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Viewcode
extension HomeView: Viewcode {
    func setupComponents() {
        addSubview(backgroundView)
        addSubview(searchStackView)
        addSubview(temperatureStackView)
    }
    
    func setupConstraints() {
        backgroundViewConstraints()
        searchStackViewConstraints()
        locationButtonConstraints()
        searchButtonConstraints()
        temperatureStackViewConstraints()
        conditionImageViewConstraints()
    }
    
    private func backgroundViewConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func searchStackViewConstraints() {
        NSLayoutConstraint.activate([
            searchStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            searchStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func locationButtonConstraints() {
        NSLayoutConstraint.activate([
            locationButton.widthAnchor.constraint(equalToConstant: Configuration.widthButton),
            locationButton.heightAnchor.constraint(equalToConstant: Configuration.heightButton)
        ])
    }
    
    private func searchButtonConstraints() {
        NSLayoutConstraint.activate([
            searchButton.widthAnchor.constraint(equalToConstant: Configuration.widthButton),
            searchButton.heightAnchor.constraint(equalToConstant: Configuration.heightButton)
        ])
    }
    
    private func temperatureStackViewConstraints() {
        NSLayoutConstraint.activate([
            temperatureStackView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 20),
            temperatureStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            temperatureStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func conditionImageViewConstraints() {
        NSLayoutConstraint.activate([
            conditionImageView.widthAnchor.constraint(equalToConstant: Configuration.widthImage),
            conditionImageView.heightAnchor.constraint(equalToConstant: Configuration.heightImage)
        ])
    }
}
