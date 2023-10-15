//
//  ListView.swift
//  Nothing
//
//  Created by Aslınur Topcu on 15.10.2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView {
            List(dataManager.cats, id: \.id) { cats in
                Text(cats.kittens)
            }
            .navigationTitle("Cats")
            .navigationBarItems(trailing: Button(action:{
                showPopup.toggle()
            },label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup) {
                NewCatView()
            }
        }
    }
}

#Preview {
    ListView()
}
