//
//  CharacterModel.swift
//  MarvelApp
//
//  Created by Sarkis Tchalekian on 21/09/2023.
//

import Foundation

struct CharacterAPIResponse: Codable {
    var data : CharacterDataContainer
}

struct CharacterDataContainer: Codable {
//    var offset : Int?
//    var limit : Int?
//    var total : Int?
//    var count : Int?
    var results : [Character]
}

struct Character: Hashable, Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: [String: String]
    var urls: [[String: String]]
}

