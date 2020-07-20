//
//  AlbumDetailTracksTableViewModel.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 20/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import Foundation

class AlbumDetailTracksTableViewModel {
    let tracks: [Track]

    init(tracks: [Track]) {
        self.tracks = tracks
    }

    func cellViewModel(for index: Int) -> AlbumDetailTracksCellViewModel? {
        guard tracks.indices.contains(index) else {
            return nil
        }

        let track = tracks[index]

        return AlbumDetailTracksCellViewModel(title: track.name,
                                              duration: track.duration,
                                              isExplicit: track.explicit)
    }
}
