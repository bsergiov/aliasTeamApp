//
//  CategoryModel.swift
//  aliasTeamApp
//
//  Created by BSergio on 23.02.2022.
//

import Foundation

struct CategoryModel {
    let id: Int
    let name: String
    
    static func getCategorys() -> [CategoryModel] {
        return [
            CategoryModel(id: 1, name: "Nature"),
            CategoryModel(id: 2, name: "Transport"),
            CategoryModel(id: 3, name: "Space"),
            CategoryModel(id: 4, name: "Travel")
        ]
    }
}
