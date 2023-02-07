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
        collectionView.registerCell(UIElementCell.self)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    //MARK: - Variables
    var UIElements : [UIElement] = [
        UIElement(image: UIImage(systemName: "button.programmable")!, name: "Buttons", viewController: ButtonViewController())
        
    ]
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSubViews()
        setupConstraints()
        view.backgroundColor = .systemGray5
    }
    
    //MARK: - init
    
    
    //MARK: - UI Setup
    private func setupSubViews() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupConstraints() {
        let constraints = [
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    //MARK: - Functions
    
    
}
//MARK: - Extensions

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UIElements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeResuableCell(for: UIElementCell.self, for: indexPath)
        cell.configure(element: UIElements[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(UIElements[indexPath.row].viewController, animated: true)
    }
    
}
