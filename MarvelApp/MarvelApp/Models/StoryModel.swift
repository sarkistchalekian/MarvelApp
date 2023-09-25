//
//  StoryModel.swift
//  MarvelApp
//
//  Created by Sarkis Tchalekian on 25/09/2023.
//

import Foundation

struct StoryAPIResponse: Codable {
    var data : StoryDataContainer
}

struct StoryDataContainer: Codable {
    var results : [Story]
}

struct Story: Hashable, Identifiable, Codable {
    var id: Int
    var title: String
    var thumbnail: [String: String]
}
