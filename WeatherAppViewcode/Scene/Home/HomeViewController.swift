//
//  HomeViewController.swift
//  WeatherAppViewcode
//
//  Created by Thyago Raphael on 28/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView: HomeView = {
        let homeView = HomeView()
        return homeView
    }()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
