//
//  NewReleases.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

struct NewReleases: Codable {
    let albums: Albums

    struct Albums: Codable {
        let href: URL
        let items: [AlbumItem]
        let limit: Int
        let next: String?
        let offset: Int
        let previous: String?
        let total: Int

        struct AlbumItem: Codable {
            let albumType: String
            let artists: [Artist]
            let availableMarkets: [String]
            let externalURLs: ExternalURL
            let href: URL
            let id: String
            let images: [Image]
            let name: String
            let releaseDate: String
            let releaseDatePrecision: String
            let totalTracks: Int
            let type: String
            let uri: String

            enum CodingKeys: String, CodingKey {
                case albumType = "album_type"
                case artists
                case availableMarkets = "available_markets"
                case externalURLs = "external_urls"
                case href
                case id
                case images
                case name
                case releaseDate = "release_date"
                case releaseDatePrecision = "release_date_precision"
                case totalTracks = "total_tracks"
                case type
                case uri
            }
        }
    }
}
