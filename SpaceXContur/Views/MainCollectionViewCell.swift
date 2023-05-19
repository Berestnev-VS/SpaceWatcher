//
//  MainCollectionViewCell.swift
//  SpaceXContur
//
//  Created by Владимир on 18.05.2023.
//

import UIKit

protocol MainCollectionViewCellDelegate: AnyObject {
    func updateHeightOfRow(_ cell: MainCollectionViewCell, _ tableView: UITableView)
}

class MainCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    static let identifier = "MainCollectionViewCell"
    
    weak var delegate: MainCollectionViewCellDelegate?
    
    let headerCollectionView = CollectionViewTableHeaderView() 
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DataTableViewCell.self, forCellReuseIdentifier: DataTableViewCell.identifier)
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.frame = contentView.frame
        tableView.delegate = self
        tableView.dataSource = self
        
//        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return headerCollectionView
        default: 
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Первая ступень"
        case 2:
            return "Вторая ступень"
        default: 
            return nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DataTableViewCell.identifier, for: indexPath) as! DataTableViewCell
        cell.descriptionLabel.text = "This cell is"
        cell.valueLabel.text = "\(indexPath.row)"
        cell.backgroundColor = .systemGreen
        return cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        delegate?.updateHeightOfRow(self, tableView)
    }
    
}
