//
//  Router.swift
//  BeerHouse
//
//  Created by Михаил on 08.07.2022.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController { get set }
    var assemblyBuilder: AssemblyBuilderProtocol { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(beer: Beer)
}

class Router: RouterProtocol {
    var navigationController: UINavigationController
    var assemblyBuilder: AssemblyBuilderProtocol
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        let mainViewComtroller = assemblyBuilder.createBeerListModule(router: self)
        navigationController.viewControllers = [mainViewComtroller]
    }
    
    func showDetail(beer: Beer) {
        let detailViewComtroller = assemblyBuilder.createDetailModule(beer: beer, router: self)
        navigationController.pushViewController(detailViewComtroller, animated: true)
    }
}


