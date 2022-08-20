//
//  ViewController.swift
//  PsychonautsApp
//
//  Created by Иван Дрожжин on 18.08.2022.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    private var characters: [Character] = []
    
    override func viewDidLoad() {
       super.viewDidLoad()
        fetchCharacters()
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CharacterCollectionViewCell
        let character = characters[indexPath.row]
        cell.character = character
        cell.setupCell(with: character)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "characterSegue", sender: characters[indexPath.row])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let characterVC = segue.destination as? CharacterViewController else { return }
        guard let selectedCharacter = sender as? Character else { return }
        characterVC.character = selectedCharacter
    }

    private func fetchCharacters() {
        NetworkManager.shared.fetchData { [weak self] result in
            switch result {
            case .success(let characters):
                self?.characters = characters
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    

}

