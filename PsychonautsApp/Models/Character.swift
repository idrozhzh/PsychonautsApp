//
//  Character.swift
//  PsychonautsApp
//
//  Created by Иван Дрожжин on 18.08.2022.
//

struct Character: Codable {
    let gender: String
    let img: String
    let name: String
    let psiPowers: [PsiPowers]
}

struct PsiPowers: Codable {
    let description: String
    let img: String
    let name: String
}
