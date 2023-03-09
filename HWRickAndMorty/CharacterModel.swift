//
//  CharacterModel.swift
//  HWRickAndMorty
//
//  Created by Anthony on 08.03.2023.
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characterModel = try? JSONDecoder().decode(CharacterModel.self, from: jsonData)

import Foundation

// MARK: - CharacterModel
struct CharacterModel: Codable {
    let info: Info?
    let results: [Result]?
}

// MARK: - Info
struct Info: Codable {
    let count: Int?
    let pages: Int?     //pages count
    let next: String?   //next page
//    let prev: JSONNull?
    let prev: String?   //prev page
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name: String?    //name
    let status, species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

/*
// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
 
*/
