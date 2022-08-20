//
//  CharacterViewController.swift
//  PsychonautsApp
//
//  Created by Иван Дрожжин on 18.08.2022.
//

import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var psiPowersCollectionView: UICollectionView!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        nameLabel.text = character.name
        genderLabel.text = character.gender
        
        ImageManager.shared.getImage(with: character.img, completion: { [weak self] result in
            switch result {
            case .success(let image):
                self?.characterImageView.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}

extension CharacterViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(character.psiPowers.count)
        return character.psiPowers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "psiPowerCell", for: indexPath) as! PsiPowersCollectionViewCell
        let psiPower = character.psiPowers[indexPath.row]
        cell.setupCell(with: psiPower)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numOfCells = CGFloat(character.psiPowers.count)

        return CGSize(
            width: (UIScreen.main.bounds.width - numOfCells * 10) / numOfCells,
            height: CGFloat(125)
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "psiPowerSegue", sender: character.psiPowers[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let psiPowerVC = segue.destination as? PsiPowerViewController else { return }
        guard let psiPower = sender as? PsiPower else { return }
        
        psiPowerVC.psiPower = psiPower
    }
}
