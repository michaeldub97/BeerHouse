//
//  MainInfoCell.swift
//  BeerHouse
//
//  Created by Михаил on 11.07.2022.
//

import UIKit

class MainInfoCell: BaseTableViewCell {
    
    let descriptionBeerDetail: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    let pairingBeerDetail: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    override func setupView() {
        super.setupView()
        selectionStyle = .none
        
        contentView.addSubview(descriptionBeerDetail)
        setupConstraintDescriptionBeerDetail()
        
        contentView.addSubview(pairingBeerDetail)
        setupConstraintPairingBeerDetail()
    }
    
    func setupConstraintDescriptionBeerDetail() {
        
        descriptionBeerDetail.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: descriptionBeerDetail, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 5))
        
        addConstraint(NSLayoutConstraint(item: descriptionBeerDetail, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 5))
        
        addConstraint(NSLayoutConstraint(item: descriptionBeerDetail, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: -5))
        
        addConstraint(NSLayoutConstraint(item: descriptionBeerDetail, attribute: .height, relatedBy: .equal, toItem: descriptionBeerDetail, attribute: .height, multiplier: 0, constant: 100))
        
    }
    
    func setupConstraintPairingBeerDetail() {
        
        pairingBeerDetail.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: pairingBeerDetail, attribute: .top, relatedBy: .equal, toItem: descriptionBeerDetail, attribute: .bottom, multiplier: 1.0, constant: 5))
        
        addConstraint(NSLayoutConstraint(item: pairingBeerDetail, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 5))
        
        addConstraint(NSLayoutConstraint(item: pairingBeerDetail, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: -5))
        
        addConstraint(NSLayoutConstraint(item: pairingBeerDetail, attribute: .height, relatedBy: .equal, toItem: pairingBeerDetail, attribute: .height, multiplier: 0, constant: 40))
    }
}
