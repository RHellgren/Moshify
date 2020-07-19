//
//  AlbumDetailViewController.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 19/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    @IBOutlet private var closeButton: UIButton!
    @IBOutlet private var coverArtImageView: UIImageView!
    @IBOutlet private var albumArtistLabel: UILabel!
    @IBOutlet private var recordLabelLabel: UILabel!
    @IBOutlet private var trackCountLabel: UILabel!

    private var viewModel: AlbumDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let viewModel = viewModel else {
            return
        }
        
        albumArtistLabel.text = "\(viewModel.albumTitle) - \(viewModel.artistName)"
        recordLabelLabel.text = viewModel.recordLabelName

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

        viewModel.load() {
            self.recordLabelLabel.text = "Label: \(viewModel.recordLabelName)"
            self.trackCountLabel.text = "\(viewModel.tracks.count) tracks"
        }
    }

    func configure(with viewModel: AlbumDetailViewModel) {
        self.viewModel = viewModel
    }

    @IBAction func didPressClose(_ sender: Any) {
        dismiss(animated: true)
    }
}
