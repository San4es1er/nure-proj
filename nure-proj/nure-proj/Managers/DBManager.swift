//
//  DBManager.swift
//  nure-proj
//
//  Created by Alex Lebedev on 13.06.2021.
//

import Foundation

import RealmSwift

class DBManager {
    static let shared = DBManager()
    let realm = try! Realm()
    private init() {}

    func writeWorkers(workers: [Worker]) {
        let workersRealm = workers.map({ $0.convertToDB()})
        let oldValues = realm.objects(WorkerRealm.self)
    
        oldValues.forEach({ old in
            try! realm.write {
                realm.delete(old)
            }
        })
        workersRealm.forEach({ worker in
            try! realm.write {
                realm.add(worker)
            }
        })
    }
    func getStoredWorkers() -> [Worker]? {
        let oldValues = realm.objects(WorkerRealm.self)
        if oldValues.isEmpty { return nil }
        var workers: [Worker] = []
        oldValues.forEach({ workers.append($0.convertToLocal())})
        return workers
    }
}
