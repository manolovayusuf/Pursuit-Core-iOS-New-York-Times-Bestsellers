//
//  MainViewController.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersViewController: UIViewController {

    public var picker = [Results]() {
        didSet {
            DispatchQueue.main.async {
                self.bestseller.bookPicker.reloadAllComponents()
            }
        }
    }
    
    public var bookInfo = [Books]() {
        didSet {
            DispatchQueue.main.async {
                self.bestseller.bestSellerCollection.reloadData()
            }
        }
    }
    
    
    let bestseller = BestSellerView() 
    let detailsViewController = DetailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  #colorLiteral(red: 0.8976260424, green: 0.5385100245, blue: 0.6717746854, alpha: 1)
        view.addSubview(bestseller)
        title = "NYT Bestsellers"
        getPickerCategories()
        setupBookLabel(genre: "Manga")
        bestseller.bestSellerCollection.dataSource = self
        bestseller.bestSellerCollection.delegate = self
        bestseller.bookPicker.delegate = self
        bestseller.bookPicker.dataSource = self
    }

private func getPickerCategories() {
    NYTBookAPI.getBookCategories { (appError, results) in
        if let appError = appError {
            print("App Error is \(appError)")
        } else if let results = results {
            self.picker = results
        }
    }
}
    
    private func setupBookLabel(genre: String) {
        NYTBookAPI.bookResults(listName: genre) { (appError, bookNames) in
            if let appError = appError {
                print("App Error is \(appError)")
            } else if let bookNames = bookNames {
                self.bookInfo = bookNames
                dump(self.bookInfo)
            }
        }
    }
    
//    private func getBookImage() {
//
//    }

private func setPickerCategories() {
    NYTBookAPI.getBookCategories { (appError, results) in
        if let appError = appError {
            print("App Error is \(appError)")
        } else if let result = results {
            print("nil")
            }
        }
    }
}

extension BestsellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookInfo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSeller", for: indexPath) as? BestsellerCollectionViewCell else {
            return UICollectionViewCell() }

        let currentBooks = bookInfo[indexPath.row]
        cell.bestSellerLabel.text = "\(currentBooks.weeks_on_list) weeks on the Bestseller's list"
        cell.briefDescription.text = currentBooks.book_details[0].description
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let detailVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { fatalError("Detail View is nil") }

    }
}

extension BestsellersViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

extension BestsellersViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker[row].display_name
    }
}



