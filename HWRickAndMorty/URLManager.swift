//
//  ApiManager.swift
//  HWRickAndMorty
//
//  Created by Anthony on 08.03.2023.
//

import Foundation

enum ApiManager {
    case next
    case prev
    
    var baseURL: String {
        return "https://rickandmortyapi.com/api/character/"
    }
    
    var pathURL: String {
        switch self {
        case .next: return "?page="
        case .prev: return "?page="
        }
    }
}


//
//"pages": 42,
//"next": "https://rickandmortyapi.com/api/character/?page=2",
//"prev": null
