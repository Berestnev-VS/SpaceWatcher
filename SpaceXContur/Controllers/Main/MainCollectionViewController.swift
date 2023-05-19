//
//  ViewController.swift
//  SpaceXContur
//
//  Created by Владимир on 17.05.2023.
//

//
//  ViewController.swift
//  SpaceXContur
//
//  Created by Владимир on 17.05.2023.
//

import UIKit

class MainCollectionViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MainCollectionViewCellDelegate {
    
    override var prefersStatusBarHidden: Bool { 
        return true
    }
    
    var collectionViewHeightConstraint: NSLayoutConstraint?
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "falcon")
        return imageView
    }()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .red
        return scrollView
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(collectionView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height),
            
            collectionView.topAnchor.constraint(equalTo: imageView.centerYAnchor),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 1000) // starting value
        collectionViewHeightConstraint?.isActive = true
    }
    
    func updateHeightOfRow(_ cell: MainCollectionViewCell, _ tableView: UITableView) {
//        let size = cell.tableView.contentSize
//        let height = size.height > 0 ? size.height : 1000
        collectionViewHeightConstraint?.constant = cell.tableView.contentSize.height
        collectionView.collectionViewLayout.invalidateLayout()
        scrollView.contentSize = CGSize(width: view.frame.width, height: imageView.frame.height / 2 + (collectionViewHeightConstraint?.constant ?? 0))
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionViewHeightConstraint?.constant ?? 1000)
    }
    
}
