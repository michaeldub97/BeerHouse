//
//  BeerListPresenter.swift
//  BeerHouse
//
//  Created by Михаил on 08.07.2022.
//

import Foundation

protocol BeerListViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol BeerListViewPresenterProtocol: AnyObject {
    init(view: BeerListViewProtocol, networkProvider: NetworkProviderProtocol, router: RouterProtocol)
    var beers: [Beer] { get set }
    
    func tapOnTheBeer(beers: Beer)
    
    func getBeers()
    
    var title: String { get }
    
    var numberOfItems: Int { get }
    
    func getBeerName(index: Int) -> String
    func getBeerImageUrl(index: Int) -> String
}

class BeerListPresenter: BeerListViewPresenterProtocol {
    
    weak var view: BeerListViewProtocol?
    let networkProvider: NetworkProviderProtocol!
    var router: RouterProtocol?
    var beers: [Beer] = []
    var title: String {
        "Beer House"
    }
    
    required init(view:BeerListViewProtocol,
                  networkProvider: NetworkProviderProtocol,
                  router: RouterProtocol) {
        self.view = view
        self.networkProvider = networkProvider
        self.router = router
        getBeers()
    }
    
    func tapOnTheBeer(beers: Beer) {
        router?.showDetail(beer: beers)
    }
    
    func getBeers(){
        networkProvider.fetchBeers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let beers):
                    self.beers = beers
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    var numberOfItems: Int {
        beers.count
    }
    
    func getBeerName(index: Int) -> String {
        let beer = beers[index]
        return beer.name
    }
    
    func getBeerImageUrl(index: Int) -> String {
        let beer = beers[index]
        return beer.image_url
    }
}
