//
//  CharacterDetailViewModel.swift
//  MarvelApp
//
//  Created by Sarkis Tchalekian on 25/09/2023.
//

import Foundation

class CharacterDetailViewModel {
    
    private var utilities = Utilities()
    
    func getComics(id: Int, completion: @escaping(Result<[Comic], Error>) -> Void) {
        
        let timestamp = String(Date().timeIntervalSince1970)
        let hash = utilities.md5(data: "\(timestamp)\(Constants.privateKey)\(Constants.publicKey)")
        let url = "https://gateway.marvel.com:443/v1/public/characters/\(id)/comics?ts=\(timestamp)&apikey=\(Constants.publicKey)&hash=\(hash)&limit=3&orderBy=onsaleDate"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            else if let data = data {
                do {
                    
                    let result = try JSONDecoder().decode(ComicAPIResponse.self, from: data)
                    completion(.success(result.data.results))
                }
                catch  {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func getEvents(id: Int, completion: @escaping(Result<[Event], Error>) -> Void) {
        
        let timestamp = String(Date().timeIntervalSince1970)
        let hash = utilities.md5(data: "\(timestamp)\(Constants.privateKey)\(Constants.publicKey)")
        let url = "https://gateway.marvel.com:443/v1/public/characters/\(id)/events?ts=\(timestamp)&apikey=\(Constants.publicKey)&hash=\(hash)&limit=3&orderBy=onsaleDate"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            else if let data = data {
                do {
                    
                    let result = try JSONDecoder().decode(EventAPIResponse.self, from: data)
                    completion(.success(result.data.results))
                }
                catch  {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func getStories(id: Int, completion: @escaping(Result<[Story], Error>) -> Void) {
        
        let timestamp = String(Date().timeIntervalSince1970)
        let hash = utilities.md5(data: "\(timestamp)\(Constants.privateKey)\(Constants.publicKey)")
        let url = "https://gateway.marvel.com:443/v1/public/characters/\(id)/stories?ts=\(timestamp)&apikey=\(Constants.publicKey)&hash=\(hash)&limit=3&orderBy=onsaleDate"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            else if let data = data {
                do {
                    
                    let result = try JSONDecoder().decode(StoryAPIResponse.self, from: data)
                    completion(.success(result.data.results))
                }
                catch  {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func getSeries(id: Int, completion: @escaping(Result<[Series], Error>) -> Void) {
        
        let timestamp = String(Date().timeIntervalSince1970)
        let hash = utilities.md5(data: "\(timestamp)\(Constants.privateKey)\(Constants.publicKey)")
        let url = "https://gateway.marvel.com:443/v1/public/characters/\(id)/series?ts=\(timestamp)&apikey=\(Constants.publicKey)&hash=\(hash)&limit=3&orderBy=onsaleDate"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            else if let data = data {
                do {
                    
                    let result = try JSONDecoder().decode(SeriesAPIResponse.self, from: data)
                    completion(.success(result.data.results))
                }
                catch  {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
