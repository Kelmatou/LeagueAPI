//
//  SkinImages.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

public class SkinImages {
    
    public var square: ImageWithUrl
    public var loading: ImageWithUrl
    public var splash: ImageWithUrl
    
    internal init(version: String, championName: String, skinNumber: Int, squareImage: LAPIImage? = nil, loadingImage: LAPIImage? = nil, splashImage: LAPIImage? = nil) {
        self.square = ImageWithUrl(url: "\(ServicesUrl.DDragonCdn)/\(version)/img/champion/\(championName).png", image: squareImage)
        self.loading = ImageWithUrl(url: "\(ServicesUrl.DDragonCdn)/img/champion/loading/\(championName)_\(skinNumber).jpg", image: loadingImage)
        self.splash = ImageWithUrl(url: "\(ServicesUrl.DDragonCdn)/img/champion/splash/\(championName)_\(skinNumber).jpg", image: splashImage)
    }
}
