//
//  Worker.swift
//  nure-proj
//
//  Created by Alex Lebedev on 13.06.2021.
//

import Foundation
import RealmSwift

struct Worker: Codable {
    
    let name: String?
    let age: Int?
    let imageUrl: String?
    let isBuzy: Bool?
    let rate: Double?
    let biography: String?
    
    func convertToDB() -> WorkerRealm {
        let model = WorkerRealm()
        model.name = self.name ?? ""
        model.age = self.age ?? 0
        model.imageUrl = self.imageUrl ?? ""
        model.isBuzy = self.isBuzy ?? false ? 1 : 0
        model.rate = self.rate ?? 0
        model.biography = self.biography ?? ""
        return model
    }
}

class WorkerRealm: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var isBuzy: Int = 0
    @objc dynamic var rate: Double = 0
    @objc dynamic var biography: String = ""
    
    func convertToLocal() -> Worker {
        let model = Worker(name: self.name, age: self.age, imageUrl: self.imageUrl, isBuzy: self.isBuzy == 1, rate: self.rate, biography: self.biography)
        return model
    }
}
