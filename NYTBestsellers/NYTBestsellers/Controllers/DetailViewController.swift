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
        self.view.addSubview(detailView)
        
        navigationItem.title = bookDetailInfo?.title 
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorites", style: .plain, target: self, action: #selector(favoriteBook))
        
    }
    
    @objc private func favoriteBook() {
        
    }
    
    

}
