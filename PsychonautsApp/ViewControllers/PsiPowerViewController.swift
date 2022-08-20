//
//  PsiPowerViewController.swift
//  PsychonautsApp
//
//  Created by Иван Дрожжин on 19.08.2022.
//

import UIKit

class PsiPowerViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var powerImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var psiPower: PsiPower!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        nameLabel.text = psiPower.name
        descriptionLabel.text = psiPower.description
        
        ImageManager.shared.getImage(with: psiPower.img, completion: { [weak self] result in
            switch result {
            case .success(let image):
                self?.powerImageView.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
