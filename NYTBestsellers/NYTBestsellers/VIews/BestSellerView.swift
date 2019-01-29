//
//  BestSellerView.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerView: UIView {
    
    public lazy var bestSellerCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 200, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        
        
        let cv = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(BestsellerCollectionViewCell.self, forCellWithReuseIdentifier: "BestSeller")
        cv.backgroundColor = .white
        return cv
        
    }()
    
    public lazy var bookPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        commonInit()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        setupCollectionView()
        setupPickerView()
    }
    
    private func setupCollectionView () {
        addSubview(bestSellerCollection)
        
        bestSellerCollection.translatesAutoresizingMaskIntoConstraints = false
        bestSellerCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        bestSellerCollection.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bestSellerCollection.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bestSellerCollection.heightAnchor.constraint(equalTo:safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    func setupPickerView() {
        addSubview(bookPicker)
        bookPicker.translatesAutoresizingMaskIntoConstraints = false
        bookPicker.topAnchor.constraint(equalTo: bestSellerCollection.bottomAnchor).isActive = true
        bookPicker.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bookPicker.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bookPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true 
    }
    
    
    
}




