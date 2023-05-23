//
//  ViewController.swift
//  SpaceXContur
//
//  Created by Владимир on 17.05.2023.
//

import UIKit


class MainCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MainCollectionViewCellDelegate {
    
    override var prefersStatusBarHidden: Bool { 
        return true
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "falcon")
        imageView.contentMode = .scaleAspectFill 
        return imageView
    }()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
//        scrollView.bounces = false
        return scrollView
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        scrollView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(imageView)
        view.addSubview(scrollView)
        scrollView.addSubview(collectionView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: view.frame.height / 2),
            collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    
    override func viewDidLayoutSubviews() {
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        if y < 0 {
            let scale = (1 + abs(y) / imageView.frame.height)
            imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        cell.clipsToBounds = true
        cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cell.layer.cornerRadius = 24
        cell.layer.cornerCurve = .continuous
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height / 2 + collectionView.frame.height - 350) 
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    
}
