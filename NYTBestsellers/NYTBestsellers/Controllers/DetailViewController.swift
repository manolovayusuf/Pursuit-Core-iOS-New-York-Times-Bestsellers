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
        let _ = FavoritesModel.getBooks()
        print(DataPersistenceManager.documentsDirectory())
        navigationItem.title = bookDetailInfo?.title 
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorites", style: .plain, target: self, action: #selector(favoriteBook))
        
    }
    
    @objc private func favoriteBook() {
        guard let book = save() else {return}
        FavoritesModel.appendBooks(favorite: book)
        showAlert(title: "Added To Favorites", message: nil)
        print("added to Favorites")
    }
    
    private func save()-> FavoriteBooks? {
        guard let image = detailView.bookDetailImage.image,
            let author = detailView.bookDetailLabel.text,
            let description = detailView.bookDetailDescription.text else {return nil}
        guard let title = bookDetailInfo?.title else {return nil}
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .medium
        let timestamp = formatter.string(from: date)
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
        let favoriteBook = FavoriteBooks.init(imageData: imageData, author: author, description: description, createdAt: timestamp, title: title)
        return favoriteBook
    }
    

}
