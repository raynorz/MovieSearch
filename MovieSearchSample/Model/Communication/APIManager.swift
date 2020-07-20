//
//  APIManager.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 09/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation
import Combine

/// Basic protocol for generic communication with server
protocol APIManager {
//    func request<T>(url: URL, completion: @escaping((Swift.Result<T, Error>) -> (Void))) where T: Decodable
    func request<T: Decodable>(url: URL) -> AnyPublisher<T, APIError>
}
