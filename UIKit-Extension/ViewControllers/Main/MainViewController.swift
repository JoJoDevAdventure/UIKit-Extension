//
//  ViewController.swift
//  UIKit-Extension
//
//  Created by Youssef Bhl on 25/03/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - UI Propreties
    private lazy var  collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().exploreLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.registerCell(LevelCollectionViewCell.self)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        return collectionView
    }()
    
    //MARK: - Variables
    
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSubViews()
        setupConstraints()
    }
    
    //MARK: - init
    
    
    //MARK: - UI Setup
    private func setupSubViews() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        let constraints = [
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    //MARK: - Functions
    
    
}
//MARK: - Extensions
