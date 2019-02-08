//
//  GoogleAPIClient .swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class GoogleAPIClient {
    static func getImage(keyword: String, completionHandler: @escaping (AppError?, [Items]?) -> Void) {
        let imageEndpoint = "https://www.googleapis.com/books/v1/volumes?q=+isbn:\(keyword)&key=\(GoogleSecretKeys.googleKey)"
        NetworkHelper.shared.performDataTask(endpointURLString: imageEndpoint) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do {
                   let images = try JSONDecoder().decode(GoogleBooks.self, from: data)
                    completionHandler(nil, images.items)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}

