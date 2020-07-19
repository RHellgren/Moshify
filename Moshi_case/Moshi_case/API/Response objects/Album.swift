//
//  Album.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

public struct Album: Codable {
    public let albumType: String
    public let artists: [Artist]
    public let availableMarkets: [String]
    public let copyrights: [Copyright]
    public let externalIds: ExternalIds
    public let externalURLs: ExternalURL
    public let genres: [Genre]
    public let href: URL
    public let id: String
    public let images: [Image]
    public let label: String
    public let name: String
    public let popularity: Int
    public let releaseDate: String
    public let releaseDatePrecision: String
    public let totalTracks: Int
    public let tracks: Tracks
    public let type: String
    public let uri: String

    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case artists
        case availableMarkets = "available_markets"
        case copyrights
        case externalIds = "external_ids"
        case externalURLs = "external_urls"
        case genres
        case href
        case id
        case images
        case label
        case name
        case popularity
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case totalTracks = "total_tracks"
        case tracks
        case type
        case uri
    }

    public struct Tracks: Codable {
        public let href: URL
        public let items: [TrackItem]
        public let limit: Int
        public let next: String?
        public let offset: Int
        public let previous: String?
        public let total: Int

        public struct TrackItem: Codable {
            public let artists: [Artist]
            public let availableMarkets: [String]
            public let discNumber: Int
            public let duration: Double
            public let explicit: Bool
            public let externalUrls: ExternalURL
            public let href: URL
            public let id: String
            public let isLocal: Bool
            public let name: String
            public let previewURL: URL?
            public let trackNumber: Int
            public let type: String
            public let uri: String

            enum CodingKeys: String, CodingKey {
                case artists
                case availableMarkets = "available_markets"
                case discNumber = "disc_number"
                case duration = "duration_ms"
                case explicit
                case externalUrls = "external_urls"
                case href
                case id
                case isLocal = "is_local"
                case name
                case previewURL = "preview_url"
                case trackNumber = "track_number"
                case type
                case uri
            }
        }
    }
}
