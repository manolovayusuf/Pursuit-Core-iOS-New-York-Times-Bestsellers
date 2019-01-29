//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    public lazy var settingsPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    func setupPickerView() {
        addSubview(settingsPicker)
        settingsPicker.translatesAutoresizingMaskIntoConstraints = false
        settingsPicker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        settingsPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        settingsPicker.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        settingsPicker.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        commonInit()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        setupPickerView()
    }
    
}


