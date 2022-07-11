//
//  Beer.swift
//  BeerHouse
//
//  Created by Михаил on 08.07.2022.
//

import Foundation

struct Beer: Decodable {
    
    let name: String
    let image_url: String
    let description: String
    let food_pairing: [String]
    let ingredients: Ingredient
}

struct Ingredient: Decodable {
    
    let malt: [Malt]

}
struct Malt: Decodable {
    
    private enum CodingKeys : String, CodingKey {
        case ingredientName = "name"
    }
    
    let ingredientName: String
}

