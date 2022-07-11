//
//  DetailBeerPresenter.swift
//  BeerHouse
//
//  Created by Михаил on 08.07.2022.
//

import Foundation

protocol DetailBeerViewProtocol: AnyObject {}

protocol DetailBeerViewPresenterProtocol: AnyObject {
    init(view: DetailBeerViewProtocol, router: RouterProtocol, beer: Beer)
    func getImage() -> String
    func getDescription() -> String
    func getName() -> String
    func getPairing() -> [String]
    func getIngredients() -> [String]
}

class DetailBeerPresenter: DetailBeerViewPresenterProtocol {

    weak var view: DetailBeerViewProtocol?
    var router: RouterProtocol?
    var beer: Beer
    
    required init(view: DetailBeerViewProtocol, router: RouterProtocol, beer: Beer) {
        self.view = view
        self.beer = beer
        self.router = router
    }
    
    func getImage() -> String {
        return beer.image_url
    }
    
    func getDescription() -> String {
        return beer.description
    }
    
    func getName() -> String {
        return beer.name
    }
    
    func getPairing() -> [String] {
        return beer.food_pairing
    }
    
    func getIngredients() -> [String] {
        return  beer.ingredients.malt.compactMap { string in
            String(string.ingredientName)
        }
    }
}
