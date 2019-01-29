//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteView: UIView {
    
    public lazy var favoriteCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 350, height: 700)
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 20, bottom: 50, right: 20)
        
        layout.scrollDirection = .vertical
        
        
        
        let cv = UICollectionView.init(frame: frame, collectionViewLayout: layout)
        cv.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: "Favorite")
        cv.backgroundColor = .white
        return cv
        
        
    }()
    
    
    
    
    func setupCellView() {
        addSubview(favoriteCollection)
        favoriteCollection.translatesAutoresizingMaskIntoConstraints = false
        favoriteCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        favoriteCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        favoriteCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        favoriteCollection.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func commonInit() {
        setupCellView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
}
