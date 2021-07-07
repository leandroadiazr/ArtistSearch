//
//  ErrorMessages.swift
//  ArtistSearch
//
//  Created by Leandro Diaz on 7/6/21.
//

import Foundation

enum ErrorMessages: String, Error {
    case invalidRequest             = "Invalid Artist Request, Please try Again..."
    case unableToComplete           = "Unable to Complete your Request, Please Check your Internet Connection"
    case invalidResponse            = "Invalid Request from the Server, Please try Again..."
}
