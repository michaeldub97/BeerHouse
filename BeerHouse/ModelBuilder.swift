//
//  ModelBuilder.swift
//  BeerHouse
//
//  Created by Михаил on 08.07.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createBeerListModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(beer: Beer, router: RouterProtocol) -> UIViewController
}

class AssemblyModelBuilder: AssemblyBuilderProtocol {
    func createBeerListModule(router: RouterProtocol) -> UIViewController {
        let view = BeerListVC()
        let networkProvider = NetworkProvider()
        
        let presenter = BeerListPresenter(view: view, networkProvider: networkProvider, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(beer: Beer, router: RouterProtocol) -> UIViewController {
        let view = DetailBeerVC()
        let presenter = DetailBeerPresenter(view: view, router: router, beer: beer)
        view.presenter = presenter
        return view
    }
}
