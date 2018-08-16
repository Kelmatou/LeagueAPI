//
//  ChampionImage.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import UIKit

public class ChampionImage: Decodable {
    
    public var squareUrl: String {
        return squareImage.url
    }
    public var loadingUrl: String {
        return loadingImage.url
    }
    public var splashUrl: String {
        return splashImage.url
    }
    
    internal let cdnUrl: String = "http://ddragon.leagueoflegends.com/cdn"
    public internal(set) var version: String {
        didSet {
            self.squareImage.url = "\(cdnUrl)/\(version)/img/champion/\(championName).png"
        }
    }
    public private(set) var championName: String
    
    private var squareImage: ImageWithUrl
    private var loadingImage: ImageWithUrl
    private var splashImage: ImageWithUrl
    
    enum CodingKeys: String, CodingKey {
        case imageName = "full"
    }
    
    internal init(version: String, championName: String, squareImage: UIImage? = nil, loadingImage: UIImage? = nil, splashImage: UIImage? = nil) {
        self.version = version
        self.championName = championName
        self.squareImage = ImageWithUrl(url: "\(cdnUrl)/\(version)/img/champion/\(championName).png", image: squareImage)
        self.loadingImage = ImageWithUrl(url: "\(cdnUrl)/img/champion/loading/\(championName)_0.jpg", image: loadingImage)
        self.splashImage = ImageWithUrl(url: "\(cdnUrl)/img/champion/splash/\(championName)_0.jpg", image: splashImage)
    }
    
    public required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let filename: String = try container.decode(String.self, forKey: .imageName)
        let champName: String = String(filename.split(separator: ".").first!)
        self.init(version: "", championName: champName)
    }
    
    public func getSquareImage(completion: @escaping (UIImage?, String?) -> Void) {
        getImage(self.squareImage) { (image, error) in
            if self.squareImage.image == nil {
                self.squareImage.image = image
            }
        }
    }
    
    public func getLoadingImage(completion: @escaping (UIImage?, String?) -> Void) {
        getImage(self.loadingImage) { (image, error) in
            if self.loadingImage.image == nil {
                self.loadingImage.image = image
            }
        }
    }
    
    public func getSplashImage(completion: @escaping (UIImage?, String?) -> Void) {
        getImage(self.splashImage) { (image, error) in
            if self.splashImage.image == nil {
                self.splashImage.image = image
            }
        }
    }
    
    private func getImage(_ imageWithUrl: ImageWithUrl, completion: @escaping (UIImage?, String?) -> Void) {
        if let localImage = imageWithUrl.image {
            completion(localImage, nil)
        }
        else {
            downloadImage(imageUrl: imageWithUrl.url) { (image, error) in
                completion(image, error)
            }
        }
    }
    
    private func downloadImage(imageUrl: String, completion: @escaping (UIImage?, String?) -> Void) {
        RESTRequester.requestImage(.GET, url: imageUrl) { (image, _, _, error) in
            completion(image, error)
        }
    }
}
