//
//  Sourse.swift
//  HWRickAndMorty
//
//  Created by Anthony on 25.02.2023.
//

import Foundation

struct Photo {
    let id: Int
    let imageName: String
}

struct Source {
    static func allPhotos() -> [Photo] {
        [
            .init(id: 0, imageName: "default"),
            .init(id: 1, imageName: "grayscale01"),
            .init(id: 2, imageName: "grayscale02"),
            .init(id: 3, imageName: "grayscale03"),
            .init(id: 4, imageName: "grayscale04")
        ]
    }
    
    // имитация загрузки фото в рандомном порядке
    static func randomPhotos(with count: Int) -> [Photo] {
        return (1..<count).map { _ in allPhotos().randomElement() ?? allPhotos()[0] }
    }
}

struct SectionPhoto {
    let sectionName: String
    var photo: [Photo]
}
