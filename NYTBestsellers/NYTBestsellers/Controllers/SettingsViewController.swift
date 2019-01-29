//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var settingsView = SettingsView()
    
    public var settingPicker = [Results]() {
        didSet {
            DispatchQueue.main.async {
                self.settingsView.settingsPicker.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        getPickerCategories()
        settingsView.settingsPicker.dataSource = self
        settingsView.settingsPicker.delegate = self
        title = "Pick Default Catagory"
        view.addSubview(settingsView)

    }
    
    private func getPickerCategories() {
        NYTBookAPI.getBookCategories { (appError, results) in
            if let appError = appError {
                print("App Error is \(appError)")
            } else if let results = results {
                self.settingPicker = results
            }
        }
    }
}

extension SettingsViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingPicker.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return settingPicker[row].display_name
    }
}
