//
//  LoginView.swift
//  Owl
//
//  Created by Nhan Cao on 4/26/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI
//import Resolver
//import FirebaseAuth

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    func signIn() {
//        Auth.auth().signIn(withEmail: self.email, password: self.password, completion: {res,err in
//            print(res)
//            print(err)
//        })
  
//        Auth.auth().signIn(email: self.email, password: self.password,  handler: {res,err in
//          print(res)
//          print(err)
//        })
    }
    
//    @Injected var authenticationService: AuthenticationService
    
    var body: some View {
        NavigationView {
        VStack {
            Text("Login")
                .font(.title)
            TextField("Email", text: $email)
//                .autocapitalization(.none)
            SecureField("Password", text: $password)
//                .autocapitalization(.none)
            Button(
                "Login",
                action: {
                    self.signIn()
            }
            )
            
            Divider()
//            NavigationLink(destination: CreateAccountView()) {
//                Text("Don't have an account?").foregroundColor(.gray)
//                Text("Create an account")
//            }.font(.footnote)

            Spacer()
        }.padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
