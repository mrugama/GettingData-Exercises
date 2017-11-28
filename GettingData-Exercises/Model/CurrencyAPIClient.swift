//
//  CurrencyAPIClient.swift
//  GettingData-Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

class CurrencyAPIClient {
    private init() {}
    static let manager = CurrencyAPIClient()
    func getCurrancy(from urlStr: String, completionHandler: @escaping (Currency) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let currancy = try JSONDecoder().decode(Currency.self, from: data)
                completionHandler(currancy)
            } catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
