//
//  MainViewController.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersViewController: UIViewController {

    let bestseller = BestSellerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  #colorLiteral(red: 0.8976260424, green: 0.5385100245, blue: 0.6717746854, alpha: 1)
        view.addSubview(bestseller)
        bestseller.myCollectionView.dataSource = self
        bestseller.myCollectionView.delegate = self
    }
}


extension BestsellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSeller", for: indexPath) as? BestsellerCollectionViewCell else {
            return UICollectionViewCell() }
        return cell
    }
}



