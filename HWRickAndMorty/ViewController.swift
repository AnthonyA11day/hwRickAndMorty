//
//  ViewController.swift
//  HWRickAndMorty
//
//  Created by Anthony on 25.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var identifier = "PhotoCell"
    
    let source: [Photo] = Source.randomPhotos(with: 60)

    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Rick & Morty"
        setupNavigationBar()
        setupColectionView()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Rick & Morty"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = .black
    }
    
    func setupColectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.backgroundColor = .systemGray3
        collectionView.showsHorizontalScrollIndicator = false //индикатор прокрутки горизонтальный
        collectionView.showsVerticalScrollIndicator = false //индикатор прокрутки вертикальный
        
        collectionView.dataSource = self
        collectionView.delegate = self

        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8)
        ])
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        
/// варианты задания величины ячейки
//        layout.estimatedItemSize = .init(width: 150, height: 150)
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.itemSize = CGSize(width: 80, height: 80)

/// варианты задания разметки
//        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
//        //        layout.sectionInset = .init(top: 16, left: 16, bottom: 16, right: 16) // другая запись верхней строчки
//
//        layout.minimumLineSpacing = 8
//        layout.minimumInteritemSpacing = 8
        return layout
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2    // количество фото по ширине
        let paddingWidth = 1 * ( itemsPerRow + 1 ) // расстояние отступов
        let availableWidth = collectionView.frame.width - paddingWidth
        let itemWidth = availableWidth / itemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }

    //отступы от секции колеекции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)

    }

    // отступы по рядам
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
        
    }

    // отсутпы между items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension ViewController: UICollectionViewDelegate {
    
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        
        cell.imageView.image = UIImage(named: source[indexPath.item].imageName)
        cell.label.text = source[indexPath.item].imageName
        return cell
    }
}
