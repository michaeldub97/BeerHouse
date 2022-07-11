//
//  BaseColletionViewCell.swift
//  BeerHouse
//
//  Created by Михаил on 08.07.2022.
//

import UIKit

class BaseColletionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
