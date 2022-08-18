//
//  NetworkManager.swift
//  PsychonautsApp
//
//  Created by Иван Дрожжин on 18.08.2022.
//

import Foundation
// https://psychonauts-api.herokuapp.com/api/characters

enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(completion: @escaping(Result<[Character], NetworkError>) -> Void) {
        guard
            let url = URL(string: "https://psychonauts-api.herokuapp.com/api/characters")
        else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let characters = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(characters))
                }
            } catch let error {
                completion(.failure(.decodingError))
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchImage(from url: String, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }.resume()
    }
    
}
