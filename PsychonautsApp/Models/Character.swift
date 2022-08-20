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
    let psiPowers: [PsiPower]
}

struct PsiPower: Codable {
    let description: String
    let img: String
    let name: String
}
