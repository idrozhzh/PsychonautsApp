//
//  CharacterCollectionViewCell.swift
//  PsychonautsApp
//
//  Created by Иван Дрожжин on 18.08.2022.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var image: UIImageView!
    @IBOutlet weak var characterLabel: UILabel!
    
    func setupCell(with character: Character) {
        characterLabel.text = character.name
        fetchImage(with: character.img, completion: { [weak self] result in
            switch result {
            case .success(let image):
                self?.image.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    private func fetchImage(with url: String, completion: @escaping(Result<UIImage, Error>) -> Void) {
        NetworkManager.shared.fetchImage(from: url) { result in
            switch result {
            case .success(let image):
                guard let uiImage = UIImage(data: image) else { return }
                completion(.success(uiImage))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
