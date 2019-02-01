//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    public var detailView = DetailView()
    
    public var bookDetailInfo: BookDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        self.view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        navigationItem.title = bookDetailInfo?.title 
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorites", style: .plain, target: self, action: #selector(favoriteBook))
        
    }
    
    @objc private func favoriteBook() {
        
    }
    
    

}
