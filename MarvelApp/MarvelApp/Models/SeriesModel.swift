//
//  SeriesModel.swift
//  MarvelApp
//
//  Created by Sarkis Tchalekian on 25/09/2023.
//

import Foundation

struct SeriesAPIResponse: Codable {
    var data : SeriesDataContainer
}

struct SeriesDataContainer: Codable {
    var results : [Series]
}

struct Series: Hashable, Identifiable, Codable {
    var id: Int
    var title: String
    var thumbnail: [String: String]
}
