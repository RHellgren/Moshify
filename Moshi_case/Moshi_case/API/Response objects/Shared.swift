//
//  Shared.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

public struct ExternalURL: Codable {
    public let spotify: URL
}

public struct Image: Codable {
    public let height: Int
    public let url: URL
    public let width: Int
}

public struct Artist: Codable {
    public let externalURLs: ExternalURL
    public let href: URL
    public let id: String
    public let name: String
    public let type: String
    public let uri: String

    enum CodingKeys: String, CodingKey {
        case externalURLs = "external_urls"
        case href
        case id
        case name
        case type
        case uri
    }
}

public struct Copyright: Codable {
    public let text: String
    public let type: String
}

public struct ExternalIds: Codable {
    public let upc: String
}

public struct Genre: Codable {
}
