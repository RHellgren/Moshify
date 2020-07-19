//
//  ReleasesTableViewControllerViewModel.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

protocol ReleasesTableViewControllerViewModelDelegate {
    func onFetchCompleted()
}

class ReleasesTableViewControllerViewModel {
    var albums: [Album] = []
    var delegate: ReleasesTableViewControllerViewModelDelegate?
    private var isFetchInProgress = false
    private var currentPage = 0

    func fetchNewReleases() {
        guard albums.count < 100 else {
            return
        }

        guard !isFetchInProgress else {
          return
        }

        isFetchInProgress = true

        DataService().getNewReleases(page: currentPage) { newReleases in
            self.isFetchInProgress = false

            if let albums = newReleases?.albums {
                self.currentPage += 1
                self.albums.append(contentsOf: albums)
            }
            
            self.delegate?.onFetchCompleted()
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
