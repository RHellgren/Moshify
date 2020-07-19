//
//  ReleasesTableViewController.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 18/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import UIKit

class ReleasesTableViewController: UITableViewController {

    var viewModel = ReleasesTableViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(ReleasesTableViewCell.self)
        tableView.delegate = self

        viewModel.load() {
            self.tableView.reloadData()
        }

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ReleasesTableViewCell = tableView.dequeueReusableCell(for: indexPath)

        if let viewModel = viewModel.cellViewModel(for: indexPath.row) {
            cell.configure(viewModel: viewModel)
            cell.delegate = self
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel.albumDetailViewModel(for: indexPath.row) else {
            return
        }

        let viewController: AlbumDetailViewController = AlbumDetailViewController.instantiate()
        viewController.configure(with: viewModel)

        present(viewController, animated: true)
    }
}

extension ReleasesTableViewController: ReleasesTableViewCellDelegate {
    func tableViewCell(_ tableViewCell: UITableViewCell, shareButtonPressedFor url: URL) {
        let activityController = UIActivityViewController(
            activityItems: [url],
            applicationActivities: nil)
        present(activityController, animated: true)
    }
}
