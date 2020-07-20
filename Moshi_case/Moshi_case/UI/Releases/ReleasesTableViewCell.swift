//
//  ReleasesTableViewCell.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import UIKit
import Kingfisher

protocol ReleasesTableViewCellDelegate {
    func tableViewCell(_ tableViewCell: UITableViewCell, shareButtonPressedFor url: URL)
}

class ReleasesTableViewCell: UITableViewCell {
    @IBOutlet private var wrapperView: UIView!
    @IBOutlet private var coverArtImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var releaseDateLabel: UILabel!
    @IBOutlet private var shareButton: UIButton!

    var delegate: ReleasesTableViewCellDelegate?
    private var shareURL: URL?

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none

        wrapperView.layer.shadowColor = UIColor.black.cgColor
        wrapperView.layer.shadowOpacity = 0.2
        wrapperView.layer.shadowOffset = .zero
        wrapperView.layer.shadowRadius = 5
        wrapperView.layer.cornerRadius = 5

        coverArtImageView.layer.cornerRadius = 5

        shareButton.layer.cornerRadius = 5
        shareButton.imageEdgeInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }

    func configure(viewModel: ReleasesTableViewCellViewModel) {
        titleLabel.text = viewModel.albumTitle
        releaseDateLabel.text = "Release date: \(viewModel.albumReleaseDate)"
        shareURL = viewModel.sharingURL
        
        if let url = viewModel.albumCoverArtURL {
            coverArtImageView.kf.indicatorType = .activity
            coverArtImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "CoverArtPlaceholder"),
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
    }

    @IBAction func didPressShare(_ sender: Any) {
        guard let shareURL = shareURL else {
            return
        }
        delegate?.tableViewCell(self, shareButtonPressedFor: shareURL)
    }
}
