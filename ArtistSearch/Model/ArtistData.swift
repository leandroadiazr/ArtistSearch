//
//  ArtistData.swift
//  ArtistSearch
//
//  Created by Leandro Diaz on 7/6/21.
//

import Foundation

// MARK: - ArtistData
struct ArtistData: Codable {
    let artist: [Artist]
    
    enum CodingKeys: String, CodingKey {
        case artist = "results"
    }
}

// MARK: - Artist
struct Artist: Codable {
    let artistName: String
    let trackName: String?
    let trackPrice: Double?
    let releaseDate: Date
    let primaryGenreName: String
    let artworkUrl60: String
    
    enum CodingKeys: String, CodingKey {
        case artistName, trackName, trackPrice, releaseDate, primaryGenreName, artworkUrl60
    }
}


