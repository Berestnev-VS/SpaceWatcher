//
//  LabelHeaderFooterView.swift
//  SpaceXContur
//
//  Created by Владимир on 18.05.2023.
//

import UIKit

class LabelHeaderFooterView: UITableViewHeaderFooterView {

    private let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with text: String) {
        titleLabel.text = text
    }
    
}
