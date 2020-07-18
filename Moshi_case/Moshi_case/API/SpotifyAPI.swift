//
//  SpotifyAPI.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

enum APIError: Error {
    case requestFailed(Error)
    case noDataResponse
    case unauthorized
    case httpError(Error)
    case failedToMatchHTTPStatusCode
    case decodingError(Error)
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class SpotifyAPI {
    internal func request<T: Codable>(url: URL, method: HTTPMethod, completion: @escaping (Result<T, APIError>) -> ()) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("Bearer \(SpotifyAPIConfig.token)", forHTTPHeaderField: "Authorization")

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { data, response, error in

            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }

            guard let data = data else {
                completion(.failure(.noDataResponse))
                return
            }

            if let httpResponse = response as? HTTPURLResponse,
                let status = httpResponse.status {
                switch status {
                case .unauthorized:
                    completion(.failure(.unauthorized))
                    return

                case .ok:
                    break

                default:
                    completion(.failure(.httpError(status)))
                    return
                }
            } else {
                completion(.failure(.failedToMatchHTTPStatusCode))
                return
            }

            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)

                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }

            } catch let error {
                completion(.failure(.decodingError(error)))
            }

        }
        dataTask.resume()
    }
}
