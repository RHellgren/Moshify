//
//  Album.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 19/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

struct Album {
    let id: String
    let name: String
    let artist: [Artist]
    let releaseDate: String
    let coverArtURL: URL?
    let sharingURL: URL
}

struct DetailedAlbum {
    let coverArtURL: URL?
    let artist: [Artist]
    let title: String
    let releaseDate: String
    let recordLabelName: String
    let tracks: [Track]
}
