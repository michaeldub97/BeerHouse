//
//  BeerCell.swift
//  BeerHouse
//
//  Created by Михаил on 08.07.2022.
//

import UIKit

class BeerCell: BaseColletionViewCell {
    
    let imageBeer: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    let nameBeer: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 2
        return label
    }()
    
    override func setupView() {
        super.setupView()
            
        self.contentView.addSubview(imageBeer)
        setupConstraintImageBeer()
        
        self.contentView.addSubview(nameBeer)
        setupConstraintNameBeer()
        
    }
    
    func setupConstraintImageBeer() {
        
        imageBeer.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: imageBeer, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: imageBeer, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: imageBeer, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: imageBeer, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: -50))
    }
    
    func setupConstraintNameBeer() {
        
        nameBeer.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: nameBeer, attribute: .top, relatedBy: .equal, toItem: imageBeer, attribute: .bottom, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: nameBeer, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: nameBeer, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: nameBeer, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0))
        
    }
}
