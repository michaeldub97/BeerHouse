//
//  DetailBeerVC.swift
//  BeerHouse
//
//  Created by Михаил on 08.07.2022.
//

import UIKit

class DetailBeerVC: UIViewController {
    
    enum DetailSection {
        case photos, main
    }
    
    let sections: [DetailSection] = [.photos, .main]
    
    var presenter: DetailBeerViewPresenterProtocol!
    
    private var detailTableView: UITableView = UITableView()
    let identifierImageCell = "ImageDetailBeerCell"
    let identifierMainInfoCell = "MainInfoCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.isScrollEnabled = false
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.register(ImageDetailBeerCell.self, forCellReuseIdentifier: identifierImageCell)
        detailTableView.register(MainInfoCell.self, forCellReuseIdentifier: identifierMainInfoCell)
        
        view.addSubview(detailTableView)
        setupConstraintDetailTableView()
    }
    
    func setupConstraintDetailTableView() {
        
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraint(NSLayoutConstraint(item: detailTableView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: detailTableView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: detailTableView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: detailTableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0))
    }
}

extension DetailBeerVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSection = sections[indexPath.row]
        
        switch currentSection {
        case .photos:
            let cellImage = detailTableView.dequeueReusableCell(withIdentifier: identifierImageCell, for: indexPath) as! ImageDetailBeerCell
            
            cellImage.roundCorners(corners: [.bottomLeft, .bottomRight] , radius: 20)
            cellImage.backgroundColor = UIColor.rgb(red: 238, green: 118, blue: 0)
            
            cellImage.detailImageBeer.loadImage(presenter.getImage())
            let ingredientString = "Ingredients: " + presenter.getIngredients().joined(separator: ", ")
            cellImage.ingredientBeerDetail.text = ingredientString
            cellImage.nameBeerDetail.text = presenter.getName()
            return cellImage
            
        case .main:
            let cellMain = detailTableView.dequeueReusableCell(withIdentifier: identifierMainInfoCell, for: indexPath) as! MainInfoCell
            cellMain.descriptionBeerDetail.text = presenter.getDescription()
            let pairingString = "Food Pairing: " + presenter.getPairing().joined(separator: ", ")
            cellMain.pairingBeerDetail.text = pairingString
            return cellMain
        }
    }
}

extension DetailBeerVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.row] {
        case .photos:
            return 380
        case .main:
            return 300
        }
    }
}

extension DetailBeerVC: DetailBeerViewProtocol {}
