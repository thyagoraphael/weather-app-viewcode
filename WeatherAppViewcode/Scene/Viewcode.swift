//
//  Viewcode.swift
//  WeatherAppViewcode
//
//  Created by Thyago Raphael on 28/04/22.
//

import Foundation

protocol Viewcode {
    func setupComponents()
    func setupConstraints()
    func setupExtraConfiguration()
}

extension Viewcode {
    func setupViewcode() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }
    
    func setupExtraConfiguration() { }
}
