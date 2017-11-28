//
//  Currancy.swift
//  GettingData-Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation


struct Currency: Codable {
    let base: String
    let rates: [String: Double]
}

enum CurrencySymbol: String {
    case USD, CNY, GBP, JPY, EUR
    static var allCurrancies: [CurrencySymbol] {
        return [.USD, .CNY, .GBP, .JPY, .EUR]
    }
}
