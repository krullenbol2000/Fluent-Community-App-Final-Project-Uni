//
//  CreateAccount.swift
//  Fluent
//
//  Created by Louise Mostovicz on 16/05/2022.
//

import SwiftUI
import SwiftfulLoadingIndicators
    
struct CreateAccount: View {
    @State public var fname: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmpassword: String = ""
   // @State var bio: String = ""
    var language = ["English", "Hebrew", "French", "Dutch","Spanish","Italian","German","Yiddish","Russian"]
    @State private var selectedLanguage = ""
    @State var bio: String = ""

    var body: some View {
        
            VStack{
                
                Text  ("Let's get started!")
                    .padding(.bottom, 20)
                    .font(Font.custom("Lobster-Regular", size: 50))
        Form {
            Section{
                TextField("First name", text: $fname)
                TextField("Email address", text: $email)
                SecureField("Password", text: $password)
                SecureField("Confirm Password", text: $confirmpassword)
                TextField("Tell us a bit about yourself", text: $bio)
                    .lineLimit(1)
                Picker("Please choose a native language", selection: $selectedLanguage) {
                    ForEach(language, id: \.self) {
                        Text($0)
                    }
                }



            }
            
            if (fname != "" && email != "" && password != "" && confirmpassword != "" && bio != "" && selectedLanguage != ""){
                
            
            if (password != confirmpassword) {
                NavigationLink(destination: Text("The passwords you have entered don't match, please try again").multilineTextAlignment(.center)) {
                    Text("Next").font(.system(size: 20, weight: .bold, design: .default))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center).foregroundColor(.gray)

            }
            }
            else if (password==confirmpassword) {
             NavigationLink(destination: SecondView()) {
                 Text("Next").font(.system(size: 20, weight: .bold, design: .default))
 .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center).foregroundColor(Color("Green"))
             }
             }
            }
            
            else {
            HStack{
                Spacer()
                LoadingIndicator(animation: .barStripes, color: Color("Blue"))
                Spacer()
            }
            }
            }

        }
    }
    }

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount()
    }
}




    //make next button red, turns green once password is confirmed and all cells filled

