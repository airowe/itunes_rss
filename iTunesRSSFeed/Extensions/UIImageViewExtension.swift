//
//  UIImageViewExtension.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/18/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {

    @discardableResult
    func loadImage(from imageUrl: String?) -> URLSessionDataTask? {

        guard let imageOrigin = imageUrl else {
            return nil
        }

        if let imageFromCache = imageCache.object(forKey: imageOrigin as AnyObject) as? UIImage {
            self.image = imageFromCache
            return nil
        }

        let task = ItunesRSSAPI.downloadImage(imageOrigin) { result in
            switch result {
                case .failure:
                    return
                case .success(let response):
                    if let imageToCache = UIImage(data: response) {
                        imageCache.setObject(imageToCache, forKey: imageOrigin as NSString)
                        DispatchQueue.main.async {
                            self.image = imageToCache
                        }
                }
            }
        }

        task?.resume()

        return task
    }
}
