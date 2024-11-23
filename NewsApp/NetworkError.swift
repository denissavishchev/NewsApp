//
//  NetworkError.swift
//  NewsApp
//
//  Created by Devis on 23/11/2024.
//

import Foundation

enum NetworkError: String, Error{
    case invalidURL = "Invalid URL"
    case invalidResponse = "Invalid response from the server"
    case invalidData = "The data received from server is invalid"
}
