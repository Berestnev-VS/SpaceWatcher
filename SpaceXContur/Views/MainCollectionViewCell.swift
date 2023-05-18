//
//  MainCollectionViewCell.swift
//  SpaceXContur
//
//  Created by Владимир on 18.05.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    static let identifier = "MainCollectionViewCell"
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(DataTableViewCell.self, forCellReuseIdentifier: DataTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tableView)
        contentView.backgroundColor = .systemPink
        tableView.backgroundColor = .systemRed
        tableView.dataSource = self
        tableView.delegate = self

        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 12
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DataTableViewCell.identifier, for: indexPath) as! DataTableViewCell
        cell.configure(with: ["Description", "Value"])
        return cell
    }
}
