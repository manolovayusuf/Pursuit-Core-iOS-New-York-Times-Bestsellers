//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func settingsPicker(row: Int)
}

class SettingsViewController: UIViewController {

    var settingsView = SettingsView()
    
    weak var delegate: SettingsViewControllerDelegate?
    
    public var settingPicker = [Results]() {
        didSet {
            DispatchQueue.main.async {
                self.settingsView.settingsPicker.reloadAllComponents()
                self.setupCategories()
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
        setupCategories()

    }
    
    func setupCategories() {
        if let category = UserDefaults.standard.value(forKey: UserDefaultsKeys.settingsPickerValue) as? Int {
            settingsView.settingsPicker.selectRow(category, inComponent: 0, animated: true)
        }
        
    }
    
    private func getPickerCategories() {
        NYTBookAPI.getBookCategories { (appError, results) in
            if let appError = appError {
                print("No categories in \(appError)")
            } else if let results = results {
                self.settingPicker = results
                if let rowSelected = (UserDefaults.standard.object(forKey: GenreKey.pickerRow) as? String) {
                    DispatchQueue.main.async {
                        self.settingsView.settingsPicker.selectRow(Int(rowSelected)!, inComponent: 0, animated: true)
                    }
                }
            }
        }
    }
}

extension SettingsViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingPicker.count
    }
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return settingPicker[row].list_name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let category = row
        UserDefaults.standard.set(category, forKey: UserDefaultsKeys.settingsPickerValue)
        delegate?.settingsPicker(row: category)
    }
    
}

