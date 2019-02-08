//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    public var favoriteView = FavoriteView()
    
    public var favoriteBook = [FavoriteBooks]() {
        didSet {
            DispatchQueue.main.async {
                self.favoriteView.reloadInputViews()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.649716258, green: 0.5847206712, blue: 0.960396111, alpha: 1)
        title = "Favorites"
        favoriteView.favoriteCollection.dataSource = self
        favoriteView.favoriteCollection.delegate = self
        view.addSubview(favoriteView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteBook = FavoritesModel.getBooks()
        favoriteView.favoriteCollection.reloadData()
    }
}

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBook.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCollectionViewCell else {
            return UICollectionViewCell()}
        let allFavorites = favoriteBook[indexPath.row]
        cell.favoriteImage.image = UIImage(data: allFavorites.imageData)
        cell.favoriteLabel.text = allFavorites.author
        cell.favoriteDescription.text = allFavorites.description
        cell.alertButton.addTarget(self, action: #selector(alertButtonPressed), for: .touchUpInside)
        return cell
    }
    
    @objc func alertButtonPressed() {
        
    }
}





