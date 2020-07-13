//
//  APIError.swift
//  ImageTracker
//
//  Created by Daniel Brezina on 09/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation

enum APIError: Error {
    case invalidURL
}

extension APIError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL Error"
        }
    }
}
