//
//  ServerCommunication.swift
//  MovieSearch
//
//  Created by Daniel Brezina on 09/07/2020.
//  Copyright © 2020 Daniel Brezina. All rights reserved.
//

import Foundation
import Combine

/// Simple server communication class
/// class implements APIManager protocol with func request<T>
final class ServerCommunication: APIManager {

}

extension ServerCommunication {
    func request<T>(url: URL) -> AnyPublisher<T, APIError> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { _ in APIError.failedRequest }
            .flatMap { data in
                decode(data.data)}
            .eraseToAnyPublisher()
    }
}

internal func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, APIError> {
    let decoder = JSONDecoder()
    return Just(data).decode(type: T.self, decoder: decoder)
        .mapError { _ in APIError.decodeError }
        .eraseToAnyPublisher()
}
