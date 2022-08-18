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
        characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CharacterCollectionViewCell
        let character = characters[indexPath.row]
        cell.setupCell(with: character)
        return cell
    }
    
    private func fetchCharacters() {
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let characters):
                self.characters = characters
                self.collectionView.reloadData()
                print("Success")
            case .failure(let error):
                print(error)
            }
        }
    }
    

}

