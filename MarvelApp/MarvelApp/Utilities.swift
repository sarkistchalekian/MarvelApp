//
//  Utilities.swift
//  MarvelApp
//
//  Created by Sarkis Tchalekian on 25/09/2023.
//

import Foundation
import CryptoKit

class Utilities {
    
    func md5(data: String)-> String {
        
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        
        return hash.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }
    
    func extractThumbnail(data: [String: String]) -> URL {
        
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        
        return URL(string: "\(path).\(ext)")!
        
    }
}
