//
//  UIElementCell.swift
//  UIKit-Extension
//
//  Created by Youssef Bhl on 25/03/2023.
//

import UIKit

class UIElementCell: UICollectionViewCell {
    
    lazy var iconImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        tintColor = .darkGray
        return img
    }()
    
    lazy var name: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .darkGray
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 10
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(iconImage)
        addSubview(name)
        let constraints = [
            iconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30),
            iconImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            iconImage.heightAnchor.constraint(equalTo: iconImage.widthAnchor),
            
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            name.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    public func configure(element: UIElement) {
        self.iconImage.image = element.image
        self.name.text = element.name
    }
    
}
