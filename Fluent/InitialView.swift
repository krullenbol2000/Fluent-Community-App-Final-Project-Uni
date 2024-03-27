//
//  ContentView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 25/04/2022.
//

import SwiftUI
let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
struct InitialView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    
    var body: some View {
        //            add alert to check for internet? htKtps://developer.apple.com/design/human-interface-guidelines/ios/views/alerts/
        NavigationView{
            VStack {
                Spacer()
                Image("CName")
                Text("Welcome!")
                    .padding()
                    .padding(.bottom, 20)
                    .font(Font.custom("Dosis-ExtraBold", size: 50))
                //                find a way to have image automatically verified after username and password are written down? change to logo?
                TextField("Username or email", text: $username)
                    .padding()
                    .font(Font.custom("Dosis-Regular", size: 20))
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding()
                SecureField("Password", text: $password)
                    .padding()
                    .font(Font.custom("Dosis-Regular", size: 20))
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(15.0)
                // add something here because this is shit
                NavigationLink(destination: Text("Contact us at +972547987573 for more help :)")) {
                    Text("Forgot password?")
                        .foregroundColor(Color.gray)
                        .font(Font.custom("Dosis-ExtraLight", size: 15))
                    
                    //                add verification with be before continuing to next page with ethan
                    
                    //              add remember me checkbox
                }
                VStack{
                    NavigationLink(destination: {//
                        
                    }
    ){
                        Text("Create an account")
                    }                         .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 50)
                        .background(Color("Green"))
                        .cornerRadius(15.0)
                        .font(Font.custom("Lobster-Regular", size: 20))
                    
                    //if true then go to meetups main
                    
                    NavigationLink(destination:
                                    {//
                    }){
                        Text("Log in")
                    }                                     .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 50)
                        .background(Color("Blue"))
                        .cornerRadius(15.0)
                        .font(Font.custom("Lobster-Regular", size: 20))
                        .padding(10)
                }
            }
        }
        //    if log in pressed and user = false then popup "account not found, create an account"
        
        
    }
}


struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningScreen()
    }
}




