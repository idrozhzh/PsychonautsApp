//
//  ImageCacheManager.swift
//  PsychonautsApp
//
//  Created by Иван Дрожжин on 20.08.2022.
//

import UIKit

class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    
    private init() {}
}
