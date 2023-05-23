//
//  MainCollectionViewCell.swift
//  SpaceXContur
//
//  Created by Владимир on 18.05.2023.
//

import UIKit

protocol MainCollectionViewCellDelegate: AnyObject {
}

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"
    
    let headerCollectionView = CollectionViewTableHeaderView()
    
    let showLaunchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.cornerCurve = .continuous
        button.setTitle("Посмотреть запуски", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        return button
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DataTableViewCell.self, forCellReuseIdentifier: DataTableViewCell.identifier)
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // delegate?.updateHeightOfRow(self, tableView)
    }
}

extension MainCollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return nil
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
        cell.backgroundColor = .black
        return cell
    }
}

extension MainCollectionViewCell: UITableViewDelegate {
}
