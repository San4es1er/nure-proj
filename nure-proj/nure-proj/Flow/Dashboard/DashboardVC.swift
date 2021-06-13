//
//  DashboardVCViewController.swift
//  nure-proj
//
//  Created by Alex Lebedev on 13.06.2021.
//

import UIKit

class DashboardVC: UIViewController {

    // MARK: - Property
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private var viewModel: DashboardViewModel!
    private var mediator: DashboardMediator!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fillViewModelCompletion()
        viewModel.getWorkersFromDB()
        viewModel.fetchWorkers()
        view.backgroundColor = .white
    }
    
    override func loadView() {
        super.loadView()
        setupLayouts()
    }
    func configure() {
        viewModel = DefaultDashboardViewModel()
        mediator = DashboardMediator(vc: self, viewModel: viewModel)
    }
    func fillViewModelCompletion() {
        viewModel.workersUpdated = { [weak self] in
            self?.mediator.updateTableView()
        }
        viewModel.openWorkerDetail = { [weak self] worker in
            let vc = UserDetailVC()
            vc.configure(model: worker)
            vc.modalPresentationStyle = .popover
            self?.present(vc, animated: true, completion: nil)
            
        }
    }
}

extension DashboardVC {
    private func setupLayouts() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
