//
//  ServerCommunication.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 09/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation

/// Simple server communication class
/// class implements APIManager protocol with func request<T>
final class ServerCommunication: APIManager { }

extension ServerCommunication {
    /// call URL request and decodes data from server into given Decodable type
    /// - Parameters:
    ///   - url: url created from some Router
    ///   - completion: Swift Result with given Decodable type (success) or error (failure)
    func request<T>(url: URL, completion: @escaping ((Result<T, Error>) -> (Void))) where T : Decodable {
        DispatchQueue.global(qos: .utility).async {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(.failure(error!))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    completion(.success(try decoder.decode(T.self, from: data)))
                } catch let error {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
}
