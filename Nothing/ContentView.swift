//
//  ContentView.swift
//  Nothing
//
//  Created by Aslınur Topcu on 13.10.2023.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    //let acikPembe = UIColor(red: 255.0/255.0, green: 182.0/255.0, blue: 193.0/255.0, alpha: 1.0)

    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View {
        if userIsLoggedIn {
            ListView()
        }else {
            content
        }
    }
    
    var content: some View {
        ZStack {
            Color.purple
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient (colors: [.pink, .red], startPoint:
                        .topLeading, endPoint: .bottomTrailing))
                .frame (width: 1000, height: 400).rotationEffect(.degrees(145))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundStyle(.white)
                    .font(.system(size: 50, weight: .bold, design: .serif))
                    .offset(x: -70, y: -200)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(ehwn: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 400,height: 1)
                    .foregroundColor(.white)
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(ehwn: email.isEmpty){
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 400,height: 1)
                    .foregroundColor(.white)
                
                Button {
                        register()
                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background {
                            RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .fill(.linearGradient(colors: [.purple, .red], startPoint: .top, endPoint: .bottomTrailing))
                            
                            
                        }
                        .foregroundColor(.white)
                    
                }
                .padding(.top)
                .offset(y: 100)
                
                Button{
                    login()
                } label: {
                    Text("Already hanve an account? Login")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y:110)
            }
            
                .frame(width: 350)
                .onAppear(){
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil {
                            userIsLoggedIn.toggle()
                        }
                        
                    }
                }
            
            /* Image(systemName: "globe")
             .imageScale(.large)
             .foregroundStyle(.tint)
             Text("Hello, world!")
             */
        }
        .ignoresSafeArea()   
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result,error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
        
        
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result,error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}


#Preview {
    ContentView()
}

extension View {
    func placeholder<Content: View>(
        ehwn shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
    
}
