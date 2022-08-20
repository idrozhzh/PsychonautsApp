//
//  PsiPowersCollectionViewCell.swift
//  PsychonautsApp
//
//  Created by Иван Дрожжин on 18.08.2022.
//

import UIKit

class PsiPowersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var psiImageView: UIImageView!

    func setupCell(with psiPower: PsiPowers) {
        ImageManager.shared.getImage(with: psiPower.img, completion: { [weak self] result in
            switch result {
            case .success(let image):
                self?.psiImageView.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
