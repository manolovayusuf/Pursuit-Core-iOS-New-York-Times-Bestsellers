//
//  AlertHelper.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 2/8/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showAlert(title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
