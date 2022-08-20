//
//  ImageManager.swift
//  PsychonautsApp
//
//  Created by Иван Дрожжин on 20.08.2022.
//

import Foundation
import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    func getImage(with url: String, completion: @escaping(Result<UIImage, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        if let cachedImage = ImageCacheManager.shared.object(forKey: url.lastPathComponent as NSString) {
            completion(.success(cachedImage))
            return
        }
        
        NetworkManager.shared.fetchImage(from: url) { result in
            switch result {
            case .success(let image):
                guard let uiImage = UIImage(data: image) else { return }
                ImageCacheManager.shared.setObject(uiImage, forKey: url.lastPathComponent as NSString)
                completion(.success(uiImage))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
