//
//  SkinImages.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import UIKit

public class SkinImages {
    
    public var squareUrl: String {
        return squareImage.url
    }
    public var loadingUrl: String {
        return loadingImage.url
    }
    public var splashUrl: String {
        return splashImage.url
    }
    
    public private(set) var version: String
    
    private let cdnUrl: String = "https://ddragon.leagueoflegends.com/cdn"
    private var squareImage: ImageWithUrl
    private var loadingImage: ImageWithUrl
    private var splashImage: ImageWithUrl
    
    internal init(version: String, championName: String, skinNumber: Int, squareImage: UIImage? = nil, loadingImage: UIImage? = nil, splashImage: UIImage? = nil) {
        self.version = version
        self.squareImage = ImageWithUrl(url: "\(cdnUrl)/\(version)/img/champion/\(championName).png", image: squareImage)
        self.loadingImage = ImageWithUrl(url: "\(cdnUrl)/img/champion/loading/\(championName)_\(skinNumber).jpg", image: loadingImage)
        self.splashImage = ImageWithUrl(url: "\(cdnUrl)/img/champion/splash/\(championName)_\(skinNumber).jpg", image: splashImage)
    }
    
    public func getSquareImage(completion: @escaping (UIImage?, String?) -> Void) {
        getImage(self.squareImage) { (image, error) in
            if self.squareImage.image == nil {
                self.squareImage.image = image
            }
            completion(image, error)
        }
    }
    
    public func getLoadingImage(completion: @escaping (UIImage?, String?) -> Void) {
        getImage(self.loadingImage) { (image, error) in
            if self.loadingImage.image == nil {
                self.loadingImage.image = image
            }
            completion(image, error)
        }
    }
    
    public func getSplashImage(completion: @escaping (UIImage?, String?) -> Void) {
        getImage(self.splashImage) { (image, error) in
            if self.splashImage.image == nil {
                self.splashImage.image = image
            }
            completion(image, error)
        }
    }
    
    private func getImage(_ imageWithUrl: ImageWithUrl, completion: @escaping (UIImage?, String?) -> Void) {
        if let localImage = imageWithUrl.image {
            completion(localImage, nil)
        }
        else {
            downloadImage(imageUrl: imageWithUrl.url, completion: completion)
        }
    }
    
    private func downloadImage(imageUrl: String, completion: @escaping (UIImage?, String?) -> Void) {
        RESTRequester().requestImage(.GET, url: imageUrl) { (image, _, _, error) in
            completion(image, error)
        }
    }
}
