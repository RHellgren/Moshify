//
//  Shared.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

public struct ExternalURL: Codable {
    let spotify: URL
}

public struct Image: Codable {
    let height: Int
    let url: URL
    let width: Int
}

public struct Artist: Codable {
    let externalURLs: ExternalURL
    let href: URL
    let id: String
    let name: String
    let type: String
    let uri: String

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
    let text: String
    let type: String
}

public struct ExternalIds: Codable {
    let upc: String
}

public struct Genre: Codable {
}
