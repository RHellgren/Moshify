//
//  AlbumDetailTracksTableViewCell.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 20/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import UIKit

class AlbumDetailTracksTableViewCell: UITableViewCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var explicitLabel: UILabel!
    @IBOutlet private var durationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none

        explicitLabel.layer.cornerRadius = 5
        explicitLabel?.layer.masksToBounds = true
    }

    func configure(viewModel: AlbumDetailTracksCellViewModel) {
        titleLabel.text = viewModel.title
        explicitLabel.isHidden = !viewModel.isExplicit

        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss"

        durationLabel.text = formatter.string(from: viewModel.duration)
    }
}

struct AlbumDetailTracksCellViewModel {
    let title: String
    let duration: Date
    let isExplicit: Bool
}

