//
//  ImageDetailBeerCell.swift
//  BeerHouse
//
//  Created by Михаил on 08.07.2022.
//

import UIKit

class ImageDetailBeerCell: BaseTableViewCell {
    
    let detailImageBeer: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    let nameBeerDetail: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let ingredientBeerDetail: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 2
        return label
    }()
    
    override func setupView() {
        super.setupView()
        selectionStyle = .none
        
        contentView.addSubview(detailImageBeer)
        setupConstraintDetailImageBeer()
        
        contentView.addSubview(nameBeerDetail)
        setupConstraintNameBeerDetail()
        
        contentView.addSubview(ingredientBeerDetail)
        setupConstraintIngredientBeerDetail()
    }
    
    func setupConstraintDetailImageBeer() {
        
        detailImageBeer.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: detailImageBeer, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: detailImageBeer, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: detailImageBeer, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: detailImageBeer, attribute: .height, relatedBy: .equal, toItem: detailImageBeer, attribute: .height, multiplier: 0, constant: 300))
    }
    
    func setupConstraintNameBeerDetail() {
        
        nameBeerDetail.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: nameBeerDetail, attribute: .top, relatedBy: .equal, toItem: detailImageBeer, attribute: .bottom, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: nameBeerDetail, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 5))
        
        addConstraint(NSLayoutConstraint(item: nameBeerDetail, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: -5))
        
        addConstraint(NSLayoutConstraint(item: nameBeerDetail, attribute: .height, relatedBy: .equal, toItem: nameBeerDetail, attribute: .height, multiplier: 0, constant: 40))
    }
    
    func setupConstraintIngredientBeerDetail() {
        
        ingredientBeerDetail.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: ingredientBeerDetail, attribute: .top, relatedBy: .equal, toItem: nameBeerDetail, attribute: .bottom, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: ingredientBeerDetail, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 5))
        
        addConstraint(NSLayoutConstraint(item: ingredientBeerDetail, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: -5))
        
        addConstraint(NSLayoutConstraint(item: ingredientBeerDetail, attribute: .height, relatedBy: .equal, toItem: ingredientBeerDetail, attribute: .height, multiplier: 1.0, constant: 0))
    }
}
