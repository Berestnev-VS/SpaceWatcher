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
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.isScrollEnabled = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row)"
        return cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        delegate?.updateHeightOfRow(self, tableView)
    }
    
}
