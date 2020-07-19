//
//  ReleasesTableViewCell.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import UIKit
import Kingfisher

class ReleasesTableViewCell: UITableViewCell {
    @IBOutlet private var coverArtImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var releaseDateLabel: UILabel!

    func configure(viewModel: ReleasesTableViewCellViewModel) {
        titleLabel.text = viewModel.albumTitle
        releaseDateLabel.text = viewModel.albumReleaseDate
        if let url = viewModel.albumCoverArtURL {
            coverArtImageView.kf.indicatorType = .activity
            coverArtImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeholderImage"),
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
    }
}
