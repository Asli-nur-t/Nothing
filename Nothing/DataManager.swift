//
//  DataManager.swift
//  Nothing
//
//  Created by Aslınur Topcu on 15.10.2023.
//

import SwiftUI
import Firebase


class DataManager: ObservableObject {
    
    @Published var cats: [Cats] = []
    
    init() {
        fetchCats()
    }
    
    func fetchCats(){
        cats.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Cats")
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let kittens = data["Kittens"] as? String ?? ""
                    
                    let cat = Cats(id: id, kittens: kittens)
                    self.cats.append(cat)
                    
                }
            }
        }
    }
    
    func addCat(KittensC: String){
        let db = Firestore.firestore()
        let ref = db.collection("Cats").document(KittensC)
        ref.setData(["Kittens" : KittensC, "id" :10] ) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}
