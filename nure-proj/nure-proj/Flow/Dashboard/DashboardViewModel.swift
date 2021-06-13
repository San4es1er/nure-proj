//
//  DashboardViewModel.swift
//  nure-proj
//
//  Created by Alex Lebedev on 13.06.2021.
//

import Foundation
protocol DashboardViewModelOutput {
    var workers: [Worker] { get }
    var workersUpdated: (() -> Void)? { get set }
    var openWorkerDetail: ((Worker) -> Void)? { get set }
}
protocol DashboardViewModelInput {
    func getWorkersFromDB()
    func fetchWorkers()
}
protocol DashboardViewModel: DashboardViewModelOutput, DashboardViewModelInput {}

class DefaultDashboardViewModel: NSObject, DashboardViewModel {
    
    // MARK: - Property
    let networkService: NetworkService = NetworkService()
    var workers: [Worker] = []
    var workersUpdated: (() -> Void)?
    var openWorkerDetail: ((Worker) -> Void)?
    
    // MARK: - Functions
    func getWorkersFromDB() {
        guard let storedWorkers = DBManager.shared.getStoredWorkers() else { return }
        self.workers = storedWorkers
        workersUpdated?()
    }
    func fetchWorkers() {
        networkService.getWorkers { [weak self] workers in
            self?.workers = workers
            self?.workersUpdated?()
        }
    }
    

    

    
}
