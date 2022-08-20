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
    
    var character: Character!
    
    func setupCell(with character: Character) {
        characterLabel.text = character.name
        ImageManager.shared.getImage(with: character.img, completion: { [weak self] result in
            switch result {
            case .success(let image):
                self?.image.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
    }
}
