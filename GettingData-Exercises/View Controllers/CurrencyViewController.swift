//
//  CurrencyViewController.swift
//  GettingData-Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {

    @IBOutlet weak var basePickerView: UIPickerView!
    @IBOutlet weak var currencyTwoPickerView: UIPickerView!
    
    var allCurrencies = [String]()
    
    var baseCurrency: Currency? {
        didSet {
            allCurrencies = baseCurrency!.rates.keys.sorted()
            basePickerView.reloadAllComponents()
            currencyTwoPickerView.reloadAllComponents()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basePickerView.dataSource = self
        basePickerView.delegate = self
        currencyTwoPickerView.dataSource = self
        currencyTwoPickerView.delegate = self
        loadData()
    }
    
    func loadData() {
        let url = "https://api.fixer.io/latest"
        let completion: (Currency) -> Void = {(currency: Currency) in
            self.baseCurrency = currency
        }
        CurrencyAPIClient.manager.getCurrancy(from: url, completionHandler: completion, errorHandler: {print($0)})
    }

}

extension CurrencyViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allCurrencies.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allCurrencies[row]
    }
    
}
