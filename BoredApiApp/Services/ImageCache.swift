//
//  ImageCache.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 23.06.2022.
//

import Foundation
import UIKit

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    
    private init() {}
}
