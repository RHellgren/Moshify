//
//  AlbumDetailTracksTableViewController.swift
//  Moshi_case
//
//  Created by Robin Hellgren on 20/07/2020.
//  Copyright © 2020 Robin Hellgren. All rights reserved.
//

import UIKit

class AlbumDetailTracksTableViewController: UITableViewController {

    private var viewModel: AlbumDetailTracksViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(AlbumDetailTracksTableViewCell.self)

        tableView.tableFooterView = UIView()
    }

    func configure(with viewModel: AlbumDetailTracksViewModel?) {
        guard let viewModel = viewModel else {
            return
        }
        
        self.viewModel = viewModel
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.tracks.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlbumDetailTracksTableViewCell = tableView.dequeueReusableCell(for: indexPath)

        if let viewModel = viewModel?.cellViewModel(for: indexPath.row) {
            cell.configure(viewModel: viewModel)
        }

        return cell
    }
}
