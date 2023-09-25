//
//  ComicModel.swift
//  MarvelApp
//
//  Created by Sarkis Tchalekian on 25/09/2023.
//

import Foundation

struct ComicAPIResponse: Codable {
    var data : ComicDataContainer
}

struct ComicDataContainer: Codable {
    var results : [Comic]
}

struct Comic: Hashable, Identifiable, Codable {
    var id: Int
    var title: String
    var thumbnail: [String: String]
}
