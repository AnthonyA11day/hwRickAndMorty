//
//  JokeStruck.swift
//  HWRickAndMorty
//
//  Created by Anthony on 09.03.2023.
//

import Foundation

// MARK: - JokeStruck
struct JokeStruck: Codable {
    let error: Bool?
    let category, type, setup, delivery: String?
    let flags: Flags?
    let safe: Bool?
    let id: Int?
    let lang: String?
}

// MARK: - Flags
struct Flags: Codable {
    let nsfw, religious, political, racist: Bool?
    let sexist, explicit: Bool?
}
