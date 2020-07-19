//
//  Album.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

public struct Album: Codable {
    let albumType: String
    let artists: [Artist]
    let availableMarkets: [String]
    let copyrights: [Copyright]
    let externalIds: ExternalIds
    let externalURLs: ExternalURL
    let genres: [Genre]
    let href: URL
    let id: String
    let images: [Image]
    let label: String
    let name: String
    let popularity: Int
    let releaseDate: String
    let releaseDatePrecision: String
    let totalTracks: Int
    let tracks: Tracks
    let type: String
    let uri: String

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

    struct Tracks: Codable {
        let href: URL
        let items: [TrackItem]
        let limit: Int
        let next: String?
        let offset: Int
        let previous: String?
        let total: Int

        struct TrackItem: Codable {
            let artists: [Artist]
            let availableMarkets: [String]
            let discNumber: Int
            let duration: Double
            let explicit: Bool
            let externalUrls: ExternalURL
            let href: URL
            let id: String
            let isLocal: Bool
            let name: String
            let previewURL: URL?
            let trackNumber: Int
            let type: String
            let uri: String

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
