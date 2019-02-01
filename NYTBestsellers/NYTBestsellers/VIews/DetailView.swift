//
//  FavoritesDetailView.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {

    public lazy var bookDetailImage: UIImageView = {
       let iv = UIImageView(image: UIImage(named: ""))
        iv.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return iv
    }()
    
    public lazy var bookDetailLabel: UILabel = {
       let label = UILabel()
        label.isEnabled = true
        return label
    }()
    
    public lazy var bookDetailDescription: UITextView = {
       let tv = UITextView()
        tv.textAlignment = .center
        tv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tv.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return tv
    }()
    
    private func setupImage() {
        addSubview(bookDetailImage)
        bookDetailImage.translatesAutoresizingMaskIntoConstraints = false
        bookDetailImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookDetailImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        bookDetailImage.widthAnchor.constraint(equalToConstant: 235).isActive = true
        bookDetailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    }
    
    private func setupLabel() {
        addSubview(bookDetailLabel)
        bookDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        bookDetailLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookDetailLabel.topAnchor.constraint(equalTo: bookDetailImage.bottomAnchor, constant: 5).isActive = true
        bookDetailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        bookDetailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        bookDetailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupDescription() {
        addSubview(bookDetailDescription)
        bookDetailDescription.translatesAutoresizingMaskIntoConstraints = false
        bookDetailDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookDetailDescription.topAnchor.constraint(equalTo: bookDetailLabel.bottomAnchor, constant: 10).isActive = true
        bookDetailDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        bookDetailDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        bookDetailDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 1, green: 0.7656593919, blue: 1, alpha: 1)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupImage()
        setupLabel()
        setupDescription()
        
    }
    
}
