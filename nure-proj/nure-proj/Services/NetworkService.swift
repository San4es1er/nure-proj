//
//  NetworkService.swift
//  nure-proj
//
//  Created by Alex Lebedev on 13.06.2021.
//

import Foundation
import FirebaseFirestore


class NetworkService {
    
    func getWorkers(completion: @escaping(([Worker]) -> Void)) {
        let db = Firestore.firestore()
        db.collection("Workers").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                guard let querySnapshot = querySnapshot else { return }
                let decoder = JSONDecoder()
                let mass = querySnapshot.documents.compactMap({ (doc) -> Worker? in
                    let jsonData = try? JSONSerialization.data(withJSONObject: doc.data())
                    let worker = try? decoder.decode(Worker.self, from: jsonData!)
                    return worker
                })
                DBManager.shared.writeWorkers(workers: mass)
                completion(mass)
            }
        }
    }

}
