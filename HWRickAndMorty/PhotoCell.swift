//
//  PhotoCell.swift
//  HWRickAndMorty
//
//  Created by Anthony on 25.02.2023.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
        setupImageView()
        contentView.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleToFill
        imageView.contentMode = .scaleAspectFit
        
        self.contentView.addSubview(imageView)
//        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
//            imageView.widthAnchor.constraint(equalToConstant: 180),
//            imageView.heightAnchor.constraint(equalToConstant: 180),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: label.topAnchor)
        ])
    }
    
    func setupLabel() {
        label = UILabel()
        label.text = "some text"
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.heightAnchor.constraint(equalToConstant: 16 * 2.5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
}
