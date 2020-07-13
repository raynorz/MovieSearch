//
//  SampleAPIManager.swift
//  MovieSearchSample
//
//  Created by Daniel Brezina on 10/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation

final class SampleAPIManager: APIManager { }

extension SampleAPIManager {
    func request<T>(url: URL, completion: @escaping ((Result<T, Error>) -> (Void))) where T : Decodable {
        completion(.success(sampleMoviesData.randomElement() as! T))
    }
}
