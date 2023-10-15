//
//  NewCatView.swift
//  Nothing
//
//  Created by Aslınur Topcu on 15.10.2023.
//

import SwiftUI

struct NewCatView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var NewCat = ""
    
    @State private var selectedImage: UIImage?
    @State private var description = ""
    
    var body: some View {
        VStack{
            TextField("Cat", text: $NewCat)
            
            Button {
                dataManager.addCat(KittensC: NewCat)
            }label: {
                Text("Save")
            }
        }
        
        .padding()
    }
}
    

#Preview {
    NewCatView()
}
