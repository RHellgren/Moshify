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

        viewModel.reload() {
            self.tableView.reloadData()
        }

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }

    // MARK: - UITablenViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ReleasesTableViewCell = tableView.dequeueReusableCell(for: indexPath)

        if let viewModel = viewModel.viewModel(for: indexPath.row) {
            cell.configure(viewModel: viewModel)
        }

        return cell
    }
}

