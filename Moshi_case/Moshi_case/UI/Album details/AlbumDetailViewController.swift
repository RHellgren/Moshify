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
    private var tracksTableView: AlbumDetailTracksTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.fetchAlbumDetails()

        updateUI()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tracksTableView = segue.destination as? AlbumDetailTracksTableViewController {
            self.tracksTableView = tracksTableView
            tracksTableView.configure(with: viewModel?.albumDetailTracksViewModel())
        }
    }

    func configure(with viewModel: AlbumDetailViewModel) {
        viewModel.delegate = self
        self.viewModel = viewModel
    }

    func updateUI() {
        guard let viewModel = viewModel else {
            return
        }

        albumArtistLabel.text = "\(viewModel.albumTitle) - \(viewModel.artistName)"
        recordLabelLabel.text = viewModel.recordLabelName

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

        if let recordLabelName = viewModel.recordLabelName {
            self.recordLabelLabel.text = "Label: \(recordLabelName)"
        }

        if let trackCount = viewModel.tracks?.count {
            self.trackCountLabel.text = "\(trackCount) tracks"
        }
    }

    @IBAction func didPressClose(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension AlbumDetailViewController: AlbumDetailViewModelDelegate {
    func onFetchCompleted() {
        updateUI()
        tracksTableView?.configure(with: viewModel?.albumDetailTracksViewModel())
    }
}
