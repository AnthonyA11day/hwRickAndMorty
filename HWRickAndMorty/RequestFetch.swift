//
//  RequestFetch.swift
//  HWRickAndMorty
//
//  Created by Anthony on 17.03.2023.
//

import Foundation
import UIKit

extension ViewController {

    func fetchData(urlString: String, compliation: @escaping ( (UIImage?) -> Void) ) {
        
//        var image = UIImage(named: "default") // default image
//        var image = UIImage(systemName: "person") // default image

        guard let url = URL(string: urlString) else { print("урл не url"); return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, respons, error) in
            if let data = data, let character = try?
                JSONDecoder().decode(CharacterModel.self, from: data) {
                self.nextLink = character.info?.next ?? ""
                self.prevLink = character.info?.prev ?? ""
                self.characters = []
                
                character.results?.forEach { item in
                    guard
                        let imageUrl = item.image,
                        let url = URL(string: imageUrl),
                        let defaultImage = UIImage(systemName: "person"),
                        let name = item.name
                    else { return }
                    URLSession.shared.dataTask(with: URLRequest(url: url)) { dataImage, respons, error in
                        guard let dataImage else { print(error ?? "error dataImage"); return }
                        self.characters.append( (name: name, image: UIImage(data: dataImage) ?? defaultImage) )
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                            self.navigationItem.rightBarButtonItem?.isEnabled = true
                        }
                        
                    }.resume()
                }
            }
        }.resume()
        
        
    }
    
}
