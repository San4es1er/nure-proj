//
//  DashboardMediator.swift
//  nure-proj
//
//  Created by Alex Lebedev on 13.06.2021.
//

import Foundation
import UIKit

class DashboardMediator: NSObject {
    
    // MARK: - Property
    var rootDashboard: DashboardVC
    var viewModel: DashboardViewModel
    
    var tableView: UITableView {
        return rootDashboard.tableView
    }
    var workers: [Worker] {
        return viewModel.workers
    }
    
    // MARK: - Init
    init(vc: DashboardVC, viewModel: DashboardViewModel) {
        self.rootDashboard = vc
        self.viewModel = viewModel
        super.init()
        configure()
    }
    
    private func configure() {
        tableView.register(WorkerCell.self, forCellReuseIdentifier: WorkerCell.description())
        tableView.delegate = self
        tableView.dataSource = self
    }
    func updateTableView() {
        tableView.reloadData()
    }
}
extension DashboardMediator: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkerCell.description()) as? WorkerCell else { return UITableViewCell()}
        cell.setup(model: workers[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.openWorkerDetail?(workers[indexPath.row])
    }
}

extension DashboardMediator: UITableViewDelegate {
    
}
