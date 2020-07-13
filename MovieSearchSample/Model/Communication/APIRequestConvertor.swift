//
//  APIRequestConvertor.swift
//  ImageTracker
//
//  Created by Daniel Brezina on 09/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation

struct URLComponentsConstants {
    static let host = "omdbapi.com"
    static let scheme = "https"
    static let title = "t"
    static let apiKey = "apikey"
    static let apiKeyValue = "5883e4d2"
}

protocol APIRequestConventor {
    var baseURLComponents: URLComponents { get }
    
    func createUrl() -> URL?
}

extension APIRequestConventor {
    var baseURLComponents: URLComponents {
        var components = URLComponents()
        components.scheme = URLComponentsConstants.scheme
        components.host = URLComponentsConstants.host
        
        components.queryItems = [URLQueryItem(name: URLComponentsConstants.apiKey, value: URLComponentsConstants.apiKeyValue)]
        return components
    }
}
