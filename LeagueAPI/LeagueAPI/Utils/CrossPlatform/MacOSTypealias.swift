//
//  MacOSTypealias.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 5/9/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

/**
 * The original code base was written for iOS
 * WatchOS and TvOS were directly compatible with the existing code
 * But MacOS uses different UIFramework and so LeagueAPI creates multiple typealias
 * to bring support without touching the existing code
 */

#if canImport(AppKit)
    import AppKit

    public typealias UIImage = NSImage

    public extension NSImage {
        
        var cgImage: CGImage? {
            var proposedRect = CGRect(origin: .zero, size: size)
            return cgImage(forProposedRect: &proposedRect, context: nil, hints: nil)
        }
    }
#endif
