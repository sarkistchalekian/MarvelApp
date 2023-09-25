//
//  HomeViewModel.swift
//  MarvelApp
//
//  Created by Sarkis Tchalekian on 24/09/2023.
//

import Foundation

class HomeViewModel {
    
    private var utilities = Utilities()
        
    func getCharacters(pageNumber: Int, completion: @escaping(Result<[Character], Error>) -> Void) {
        
        let offset = (pageNumber-1)*20
        let timestamp = String(Date().timeIntervalSince1970)
        let hash = utilities.md5(data: "\(timestamp)\(Constants.privateKey)\(Constants.publicKey)")
        let url = "https://gateway.marvel.com:443/v1/public/characters?ts=\(timestamp)&apikey=\(Constants.publicKey)&hash=\(hash)&limit=20&offset=\(offset)"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            else if let data = data {
                do {
                    
                    let result = try JSONDecoder().decode(CharacterAPIResponse.self, from: data)
                    completion(.success(result.data.results))
                }
                catch  {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }

    func hasReachedEnd() {
        
    }
    
}
