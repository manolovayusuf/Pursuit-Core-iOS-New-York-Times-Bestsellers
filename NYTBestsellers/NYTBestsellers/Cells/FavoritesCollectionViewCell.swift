//
//  FavoritesCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    public lazy var favoriteImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "pursuit-logo"))
        image.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return image
    }()

    public lazy var favoriteLabel: UILabel = {
        let label = UILabel()
        label.text =  "Days on the bestseller list"
        label.isEnabled = true
        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    public lazy var favoriteDescription: UITextView = {
        let text = UITextView()
        text.text = "Favorite blurb"
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 20)
        return text
    }()
    
    public lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle(". . .", for: .normal)
        return button
    }()
    
    func setFavoriteImage(){
        addSubview(favoriteImage)
        favoriteImage.translatesAutoresizingMaskIntoConstraints = false
        favoriteImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        favoriteImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        favoriteImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        favoriteImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
    }

    func setupFavoriteLabel() {
        addSubview(favoriteLabel)
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.bottomAnchor.constraint(equalTo: favoriteImage.bottomAnchor).isActive = true
        favoriteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        favoriteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    func setupFavoriteDescription(){
        addSubview(favoriteDescription)
        favoriteDescription.translatesAutoresizingMaskIntoConstraints = false
        favoriteDescription.topAnchor.constraint(equalTo: favoriteLabel.bottomAnchor).isActive = true
        favoriteDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        favoriteDescription.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        favoriteDescription.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        favoriteDescription.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func setupAlertButton() {
        addSubview(alertButton)
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        alertButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setFavoriteImage()
        setupFavoriteLabel()
        setupFavoriteDescription()
        setupAlertButton()
    }
}
