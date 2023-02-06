//
//  File.swift
//  UIKit-Extension
//
//  Created by Youssef Bhl on 25/03/2023.
//

import Foundation
import UIKit

extension UICollectionViewFlowLayout {
    
    func exploreLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2 - 15, height: UIScreen.main.bounds.width/2 - 15)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        return layout
    }
    
}

extension UICollectionView {
    
    public func reuseIdentifier<T>(for type: T.Type) -> String {
        return String(describing: type)
    }
    
    public func dequeResuableCell<T: UICollectionViewCell>(for type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier(for: type), for: indexPath) as? T else {
            fatalError("failed to deque cell.")
        }
        return cell
    }
    
    public func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        register(type, forCellWithReuseIdentifier: reuseIdentifier(for: type))
    }
    
}
