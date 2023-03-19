//
//  RequestRest.swift
//  HWRickAndMorty
//
//  Created by Anthony on 08.03.2023.
//

import Foundation
import UIKit

extension ViewController {
    
    func restRequst(urlString: String) {
        
        guard let baseURL = URL(string: urlString) else { return }
        let request = URLRequest(url: baseURL)
        URLSession.shared.dataTask(with: request) { (data, respons, error) in
            if let data = data, let character = try?
                JSONDecoder().decode(CharacterModel.self, from: data) {
                self.nextLink = character.info?.next ?? ""
                self.prevLink = character.info?.prev ?? ""
//                var characters: [(name: String, image: UIImage)] = []
                self.characters = []
                
                character.results?.forEach { item in
//                    self.namesArray.append(item.name ?? "nilll")
                                        
                    guard
                        let imageUrl = item.image,
                        let url = URL(string: imageUrl),
                        let defaultImage = UIImage(systemName: "person"),
                        let name = item.name
                    else { return }
                    
                    
                    URLSession.shared.dataTask(with: URLRequest(url: url)) { dataImage, respons, error in
                        guard let dataImage else { print(error ?? "error"); return }
                        
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


        
//
//
//        guard let url = URL(string: urlString) else { return }
//
//        let requst = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: requst) { ( data, respons, error ) in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            guard let data = data else { return }
//
//            let jsonString = String(data: data, encoding: .utf8)
//
////            do {
////                let result = try JSONDecoder().decode([Result].self, from: data)
////                print(result.first?.name)
////            } catch {
////                print(error)
////            }
//
//        }.resume()
    
