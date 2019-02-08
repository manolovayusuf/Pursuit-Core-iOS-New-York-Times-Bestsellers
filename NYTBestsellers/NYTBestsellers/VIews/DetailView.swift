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
       let iv = UIImageView(image: UIImage(named: "pursuit-logo"))
        iv.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    public lazy var bookDetailLabel: UILabel = {
       let label = UILabel()
        label.text = "HELLO IM MANNY YOUR OVERLORD!!! o_o"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    public lazy var bookDetailDescription: UITextView = {
       let tv = UITextView()
        tv.textAlignment = .center
        tv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tv.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tv.text = "HELLO IM MANNY YOUR OVERLORD!!! o_o"
        return tv
    }()
    
    private func setupImage() {
        addSubview(bookDetailImage)
        bookDetailImage.translatesAutoresizingMaskIntoConstraints = false
        bookDetailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        bookDetailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        bookDetailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        bookDetailImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    }

    private func setupLabel() {
        addSubview(bookDetailLabel)
        bookDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        bookDetailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        bookDetailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        bookDetailLabel.topAnchor.constraint(equalTo: bookDetailImage.bottomAnchor, constant: 11).isActive = true
    }

    private func setupDescription() {
        addSubview(bookDetailDescription)
        bookDetailDescription.translatesAutoresizingMaskIntoConstraints = false
        bookDetailDescription.topAnchor.constraint(equalTo: bookDetailLabel.bottomAnchor, constant: 55).isActive = true
        bookDetailDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        bookDetailDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        bookDetailDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupImage()
        self.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        setupLabel()
        setupDescription()
        
    }
    
}
