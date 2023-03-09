//
//  RequestRest.swift
//  HWRickAndMorty
//
//  Created by Anthony on 08.03.2023.
//

import Foundation
import UIKit


extension ViewController {
    
    
    
//    var baseURL: String {
//        return "https://rickandmortyapi.com/api/character/"
//    }
//
//    var pathURL: String {
//        switch self {
//        case .next: return "?page="
//        case .prev: return "?page="
//        }
//    }
    

    func restRequst() {
        
        guard let baseURL = URL(string: "https://v2.jokeapi.dev/joke/Any") else { return }
        
        var requst = URLRequest(url: baseURL)
        
        let task = URLSession.shared.dataTask(with: requst) { (data, respons, error) in
            
            if let data = data, let joke = try?
                
                JSONDecoder().decode(JokeStruck.self, from: data) {
                print(joke.flags?.racist)
                print(joke.setup)
            }
        }
        task.resume()
    }
}
