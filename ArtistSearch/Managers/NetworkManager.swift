//
//  NetworkManager.swift
//  ArtistSearch
//
//  Created by Leandro Diaz on 7/6/21.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURL =  "https://itunes.apple.com/search?term="
    
    func getArtist(for artist: String, completed: @escaping (Result<[Artist]?, ErrorMessages>) -> Void){
        let endPoint = baseURL + artist
        guard let url = URL(string: endPoint) else {
            completed(.failure( .invalidRequest))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure( .unableToComplete))
                return
            }
            
            guard let result = response as? HTTPURLResponse, result.statusCode == 200 else {
                completed(.failure( .invalidResponse))
                return
            }
            
            guard let data = data else { completed(.failure( .invalidRequest))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy     = .convertFromSnakeCase
                decoder.dateDecodingStrategy    = .iso8601
                let dataReceived = try decoder.decode(ArtistData.self, from: data)
                completed(.success(dataReceived.artist))
            } catch {
                completed(.failure( .unableToComplete))
            }
        }
        dataTask.resume()
    }
}

