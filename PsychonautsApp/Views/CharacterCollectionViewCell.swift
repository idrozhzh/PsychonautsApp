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
        image.image = UIImage(named: "Image")
    }
    
}
