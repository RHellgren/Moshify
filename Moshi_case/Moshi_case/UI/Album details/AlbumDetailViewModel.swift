//
//  AlbumDetailViewModel.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 19/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

protocol AlbumDetailViewModelDelegate {
    func onFetchCompleted()
}

class AlbumDetailViewModel {
    let id: String
    let albumCoverArtURL: URL?
    let artistName: String
    let albumTitle: String
    let albumReleaseDate: String
    var recordLabelName: String?
    var tracks: [Track]?

    var delegate: AlbumDetailViewModelDelegate?
    private var isFetchInProgress = false

    init(album: Album) {
        id = album.id
        albumCoverArtURL = album.coverArtURL
        artistName = album.artist.map({ $0.name }).joined(separator: ", ")
        albumTitle = album.name
        albumReleaseDate = album.releaseDate
    }

    func fetchAlbumDetails() {
        guard !isFetchInProgress else {
          return
        }

        isFetchInProgress = true

        DataService().getDetailedAlbum(id: id) { detailedAlbum in
            if let detailedAlbum = detailedAlbum {
                self.recordLabelName = detailedAlbum.recordLabelName
                self.tracks = detailedAlbum.tracks
            }

            self.delegate?.onFetchCompleted()
        }
    }

    func albumDetailTracksTableViewModel() -> AlbumDetailTracksTableViewModel {
        return AlbumDetailTracksTableViewModel(tracks: tracks ?? [])
    }

}
