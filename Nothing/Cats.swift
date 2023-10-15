//
//  Cats.swift
//  Nothing
//
//  Created by Aslınur Topcu on 15.10.2023.
//

import SwiftUI

struct Cats: Identifiable {
    
    var id : String
    var kittens: String
}

struct Photo {
    var id: String
    var imageURL: String
    var description: String
    var date: Date
    // Diğer özellikler buraya eklenebilir
}
