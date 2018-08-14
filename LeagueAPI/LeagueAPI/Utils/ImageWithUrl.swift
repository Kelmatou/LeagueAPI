//
//  ImageWithUrl.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import UIKit

internal class ImageWithUrl {
    
    public var url: String
    public var image: UIImage?
    
    public init(url: String, image: UIImage?) {
        self.url = url
        self.image = image
    }
}
