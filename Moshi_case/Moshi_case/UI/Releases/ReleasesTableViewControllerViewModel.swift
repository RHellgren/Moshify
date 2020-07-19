//
//  ReleasesTableViewControllerViewModel.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

class ReleasesTableViewControllerViewModel {
    var albums: [Album] = []

    func load(completion: @escaping () -> Void) {
        DataService().getNewReleases { newReleases in
            if let albums = newReleases?.albums {
                self.albums = albums
            }
            completion()
        }
    }

    func cellViewModel(for index: Int) -> ReleasesTableViewCellViewModel? {
        guard albums.indices.contains(index) else {
            return nil
        }

        let album = albums[index]

        return ReleasesTableViewCellViewModel(albumTitle: album.name,
                                              albumReleaseDate: album.releaseDate,
                                              albumCoverArtURL: album.coverArtURL,
                                              sharingURL: album.sharingURL)
    }

    func albumDetailViewModel(for index: Int) -> AlbumDetailViewModel? {
        guard albums.indices.contains(index) else {
            return nil
        }

        let album = albums[index]

        return AlbumDetailViewModel(album: album)
    }
}
