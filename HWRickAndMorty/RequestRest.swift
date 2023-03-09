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
        
        let requst = URLRequest(url: baseURL)
        
        let task = URLSession.shared.dataTask(with: requst) { (data, respons, error) in
            
            if let data = data, let character = try?
                
                JSONDecoder().decode(CharacterModel.self, from: data) {
                
                self.nextLink = character.info?.next ?? ""
                
                self.prevLink = character.info?.prev ?? ""
                
                print(character.info?.pages ?? "")
                
                //                print(character.results?.name) //array
            }
        }
        task.resume()
    }
}

extension ViewController {
    
    func arrayRequst() {
        
        let urlString = "https://rickandmortyapi.com/api/character/1"
        
        guard let baseURL = URL(string: urlString) else { return }
        
        let requst = URLRequest(url: baseURL)
        
        let task = URLSession.shared.dataTask(with: requst) { (data, respons, error) in
            
            if let data = data, let result = try?
                
                JSONDecoder().decode(Result.self, from: data) {
                
                print(result.name ?? "")
                
            }
        }
        task.resume()
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
    
