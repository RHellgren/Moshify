//
//  DataService.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 19/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation
import Spotify

class DataService {
    private let api = Spotify.SpotifyAPI()

    func getNewReleases(completion: @escaping (NewReleases?) -> Void) {
        api.getNewReleases { apiNewReleases in
            guard let apiNewReleases = apiNewReleases else {
                completion(nil)
                return
            }

            let albums = apiNewReleases.albums.items.map {
                Album(name: $0.name, releaseDate: $0.releaseDate)
            }
            completion(NewReleases(albums: albums))
        }
    }
}
