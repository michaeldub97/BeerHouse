//
//  BeerListVC.swift
//  BeerHouse
//
//  Created by Михаил on 08.07.2022.
//

import UIKit

class BeerListVC: UIViewController {
    
    var presenter: BeerListViewPresenterProtocol!
    
    lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refresh
    }()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let identifierBeerCell = "identifierBeerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = presenter.title
        
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.rgb(red: 238, green: 118, blue: 0)
        collectionView.register(BeerCell.self, forCellWithReuseIdentifier: identifierBeerCell)
        
        self.view.addSubview(collectionView)
        setupConstraintCollectionView()
        
        self.collectionView.addSubview(refreshControl)
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        sender.endRefreshing()
    }
    
    func setupConstraintCollectionView() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0))
    }
}

extension BeerListVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierBeerCell, for: indexPath) as! BeerCell
        cell.layer.cornerRadius = 20
        cell.backgroundColor = UIColor.rgb(red: 238, green: 91, blue: 0)
        cell.nameBeer.text = presenter?.getBeerName(index: indexPath.row)
        cell.imageBeer.loadImage(presenter.getBeerImageUrl(index: indexPath.row))
        return cell
    }
}

extension BeerListVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionWidth = collectionView.bounds.size.width - 16
        let width = collectionWidth/2
        let imageAspectRatio: CGFloat = 600/400
        let height = width * imageAspectRatio
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let beer = presenter.beers[indexPath.row]
        presenter.tapOnTheBeer(beers: beer)
    }
}

extension BeerListVC: BeerListViewProtocol {
    
    func succes() {
        collectionView.reloadData()
    }
    
    func failure(error: Error) {
        
    }
}

