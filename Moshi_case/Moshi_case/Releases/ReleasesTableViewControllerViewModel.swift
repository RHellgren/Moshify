//
//  ReleasesTableViewControllerViewModel.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

class ReleasesTableViewControllerViewModel {
    var albums: [NewReleases.Albums.AlbumItem] = []

    func reload(completion: @escaping () -> Void) {
        SpotifyAPI().getNewReleases { newReleases in
            if let newReleases = newReleases {
                self.albums = newReleases.albums.items
                completion()
            } else {
                print("unable to fetch albums")
            }
        }
    }

    func viewModel(for index: Int) -> ReleasesTableViewCellViewModel? {
        guard albums.indices.contains(index) else {
            return nil
        }

        let album = albums[index]

        return ReleasesTableViewCellViewModel(albumTitle: album.name, albumReleaseDate: album.releaseDate)
    }
}
