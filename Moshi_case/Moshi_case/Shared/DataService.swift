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
                Album(id: $0.id,
                      name: $0.name,
                      artist: $0.artists.map { Artist(name: $0.name) },
                      releaseDate: $0.releaseDate,
                      coverArtURL: $0.images.first?.url,
                      sharingURL: $0.externalURLs.spotify)
            }
            completion(NewReleases(albums: albums))
        }
    }

    func getDetailedAlbum(id: String, completion: @escaping (DetailedAlbum?) -> Void) {

        api.getAlbum(id: id) { detailedAlbum in
            guard let detailedAlbum = detailedAlbum else {
                completion(nil)
                return
            }

            let mainArtists = detailedAlbum.artists.map { Artist(name: $0.name) }

            let tracks = detailedAlbum.tracks.items.map {
                Track(artists: $0.artists.map { Artist(name: $0.name) },
                      name: $0.name,
                      duration: $0.duration,
                      explicit: $0.explicit)
            }

            let album = DetailedAlbum(coverArtURL: detailedAlbum.images.first?.url,
                                      artist: mainArtists,
                                      title: detailedAlbum.name,
                                      releaseDate: detailedAlbum.releaseDate,
                                      recordLabelName: detailedAlbum.label,
                                      tracks: tracks)
            completion(album)
        }

    }
}
