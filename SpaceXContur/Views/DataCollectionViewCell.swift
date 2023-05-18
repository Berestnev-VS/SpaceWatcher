//
//  DataCollectionViewCell.swift
//  SpaceXContur
//
//  Created by Владимир on 18.05.2023.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    let descriptionLabel: UILabel = {
        let label = UILabel() 
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        return label
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel() 
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.textAlignment = .right
        return label
    }()
    
    static let identifier = "DataCollectionViewCell"
    
    public func configure(with model: [String]) {
        descriptionLabel.text = model[0]
        valueLabel.text = model[0]
    }
}

