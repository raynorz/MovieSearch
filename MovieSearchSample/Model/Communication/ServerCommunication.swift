//
//  ServerCommunication.swift
//  ImageTracker
//
//  Created by Daniel Brezina on 09/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation

final class ServerCommunication: APIManager { }

extension ServerCommunication {
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
