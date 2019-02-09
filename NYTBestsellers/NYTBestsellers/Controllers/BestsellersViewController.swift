//
//  MainViewController.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersViewController: UIViewController {

    public var genrePicker = [Results]() {
        didSet {
            DispatchQueue.main.async {
                self.bestseller.bookPicker.reloadAllComponents()
                if let chosenCategory = UserDefaults.standard.value(forKey: UserDefaultsKeys.settingsPickerValue) as? Int {
                    self.bestseller.bookPicker.selectRow(chosenCategory, inComponent: 0, animated: true)
                    self.setupBooks(genre: self.genrePicker[chosenCategory].display_name)
                } else {
                    print("no category in defaults")
                }
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
    
    public var detailBookInfo = [BookDetail]() {
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
        setupBooks(genre: "Manga")
        bestseller.bestSellerCollection.dataSource = self
        bestseller.bestSellerCollection.delegate = self
        bestseller.bookPicker.delegate = self
        bestseller.bookPicker.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userDefaults()
    }

private func getPickerCategories() {
    NYTBookAPI.getBookCategories { (appError, results) in
        if let appError = appError {
            print("App Error is \(appError)")
        } else if let results = results {
            self.genrePicker = results
        }
    }
}
    
    public func setupBooks(genre: String) {
        NYTBookAPI.bookResults(listName: genre) { (appError, bookNames) in
            if let appError = appError {
                print("App Error is \(appError)")
            } else if let bookNames = bookNames {
                self.bookInfo = bookNames
            }
        }
    }
    
    private func userDefaults() {
        if let userKeyword: String = UserDefaults.standard.object(forKey: SecretKeys.bookKey) as? String {
            setupBooks(genre: userKeyword.replacingOccurrences(of: " ", with: "-"))
            if let pickerSelection = (UserDefaults.standard.object(forKey: GenreKey.pickerRow) as? String) {
                DispatchQueue.main.async {
                    self.bestseller.bookPicker.selectRow(Int(pickerSelection)!, inComponent: 0, animated: true)
                }
            }
        }
    }
    
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
        
        GoogleAPIClient.getImage(keyword: currentBooks.book_details[0].primary_isbn13) { (appError, image) in
            if let appError = appError {
                DispatchQueue.main.async {
                    cell.bookImage.image = UIImage(named: "book")
            }
            } else if let data = image {
                dump(data)
                ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.smallThumbnail, completion: { (appError, smallImage) in
                    if let appError = appError {
                        print("small thumbnail \(appError) error")
                    } else if let smallImage = smallImage {
                        DispatchQueue.main.async {
                            cell.bookImage.image = smallImage
                            cell.briefDescription.text = data[0].volumeInfo.description
                        }
                    }
                })
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let bookCell = collectionView.cellForItem(at: indexPath) as? BestsellerCollectionViewCell else {return}
        let book = bookInfo[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.bookDetailInfo = book.book_details[0]
        detailVC.detailView.bookDetailImage.image = bookCell.bookImage.image
        detailVC.detailView.bookDetailDescription.text = bookCell.briefDescription.text
        detailVC.detailView.bookDetailLabel.text = book.book_details.first?.author
        self.navigationController?.pushViewController(detailVC, animated: true)

    }
}

extension BestsellersViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genrePicker.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

extension BestsellersViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genrePicker[row].list_name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setupBooks(genre: genrePicker[row].list_name.replacingOccurrences(of: " ", with: "-"))
    }
}

extension BestsellersViewController: SettingsViewControllerDelegate {
    func settingsPicker(row: Int) {
        self.bestseller.bookPicker.selectRow(row, inComponent: 0, animated: true)
        setupBooks(genre: genrePicker[row].display_name) //find correct type
    }
}


