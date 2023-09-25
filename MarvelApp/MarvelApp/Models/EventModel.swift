//
//  EventModel.swift
//  MarvelApp
//
//  Created by Sarkis Tchalekian on 25/09/2023.
//

import Foundation

struct EventAPIResponse: Codable {
    var data : EventDataContainer
}

struct EventDataContainer: Codable {
    var results : [Event]
}

struct Event: Hashable, Identifiable, Codable {
    var id: Int
    var title: String
    var thumbnail: [String: String]
}
