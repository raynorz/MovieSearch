//
//  APIError.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 09/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case failedRequest
    case decodeError
}

extension APIError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL Error"
        case .failedRequest:
            return "Request failed"
        case .decodeError:
            return "Error while decoding response"
        }
    }
}
