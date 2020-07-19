//
//  NewReleases.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

public struct NewReleases: Codable {
    public let albums: Albums

    public struct Albums: Codable {
        public let href: URL
        public let items: [AlbumItem]
        public let limit: Int
        public let next: String?
        public let offset: Int
        public let previous: String?
        public let total: Int

        public struct AlbumItem: Codable {
            public let albumType: String
            public let artists: [Artist]
            public let availableMarkets: [String]
            public let externalURLs: ExternalURL
            public let href: URL
            public let id: String
            public let images: [Image]
            public let name: String
            public let releaseDate: String
            public let releaseDatePrecision: String
            public let totalTracks: Int
            public let type: String
            public let uri: String

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
