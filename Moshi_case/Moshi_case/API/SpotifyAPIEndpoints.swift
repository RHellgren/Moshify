//
//  SpotifyAPIEndpoints.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

extension SpotifyAPI {

    public func getNewReleases(completion: @escaping (NewReleases?) -> Void) {
        var components = URLComponents()
        components.scheme = SpotifyAPIConfig.scheme
        components.host = SpotifyAPIConfig.url
        components.path = "/v1/browse/new-releases"

        if let regionCode = Locale.current.regionCode {
            components.queryItems = [
                URLQueryItem(name: "country", value: regionCode)
            ]
        }

        guard let url = components.url else {
            completion(nil)
            return
        }

        request(url: url, method: .get) { (result: Result<NewReleases, APIError>) in
            switch result {
            case .success(let newReleases):
                completion(newReleases)

            case .failure(let error):
                print("Failed to get new releases, error: \(error)")
                completion(nil)
            }
        }
    }

    public func getAlbum(id: String, completion: @escaping (Album?) -> Void) {
        var components = URLComponents()
        components.scheme = SpotifyAPIConfig.scheme
        components.host = SpotifyAPIConfig.url
        components.path = "/v1/albums/\(id)"

        if let regionCode = Locale.current.regionCode {
            components.queryItems = [
                URLQueryItem(name: "market", value: regionCode)
            ]
        }

        guard let url = components.url else {
            completion(nil)
            return
        }

        request(url: url, method: .get) { (result: Result<Album, APIError>) in
            switch result {
            case .success(let album):
                completion(album)

            case .failure(let error):
                print("Failed to get album, error: \(error)")
                completion(nil)
            }
        }
    }
}
