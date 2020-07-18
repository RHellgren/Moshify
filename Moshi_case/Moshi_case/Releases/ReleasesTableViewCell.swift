//
//  ReleasesTableViewCell.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import UIKit

class ReleasesTableViewCell: UITableViewCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var releaseDateLabel: UILabel!

    func configure(viewModel: ReleasesTableViewCellViewModel) {
        titleLabel.text = viewModel.albumTitle
        releaseDateLabel.text = viewModel.albumReleaseDate
    }
}
