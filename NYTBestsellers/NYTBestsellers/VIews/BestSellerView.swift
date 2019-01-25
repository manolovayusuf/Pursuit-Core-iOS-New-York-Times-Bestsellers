//
//  BestSellerView.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerView: UIView {

    lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
        let cv = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(BestsellerCollectionViewCell.self, forCellWithReuseIdentifier: "BestSeller")
        cv.backgroundColor = .white
        return cv
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        setupCollectionView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView () {
        addSubview(myCollectionView)
        
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        
        myCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        myCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    myCollectionView.heightAnchor.constraint(equalTo:safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        
    }
}
