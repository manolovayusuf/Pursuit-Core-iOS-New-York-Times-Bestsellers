//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    var favoriteView = FavoriteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.649716258, green: 0.5847206712, blue: 0.960396111, alpha: 1)
        title = "Favorites"
        favoriteView.favoriteCollection.dataSource = self
        favoriteView.favoriteCollection.delegate = self
        view.addSubview(favoriteView)
        
    }
}
extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Favorite", for: indexPath) as? FavoriteCollectionViewCell else {
            return UICollectionViewCell()}
        return cell
        
    }
}




