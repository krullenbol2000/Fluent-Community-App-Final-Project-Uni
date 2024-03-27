//
//  ChatViewHeader.swift
//  Fluent
//
//  Created by Louise Mostovicz on 21/05/2022.
//

import SwiftUI

struct ChatViewHeader: View {
    @Environment(\.presentationMode) var presentationMode
    let name: String
    let imageURL: URL?
    let tlanguage: String
    let phoneAction: () -> Void
//    make french stay purple, color according to languages
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.top).shadow(radius: 3)
            HStack{
                Button(action: {presentationMode.wrappedValue.dismiss() }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.textPrimary)
                        .font(.system(size:28, weight: .semibold))
                })
                Spacer()
                VStack(spacing:6){
                    Spacer()
                    RoundedImage(url: imageURL)
                        .frame(height: 45)
                        Text(name + " is learning: " + tlanguage)        .font(Font.custom("Dosis-ExtraLight", size: 19))
                        Spacer()
                }
                        Spacer()
                Button(action: { phoneAction() }, label: {
                    Image(systemName: "phone.fill")
                        .foregroundColor(Color("Blue"))
                        .font(.system(size: 28, weight: .bold))
                })
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 3)
        }
        .frame(height: 30)
    }
}
struct ChatViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person.example
        ChatViewHeader(name: person.name, imageURL: person.imageURLS.first, tlanguage:person.tlanguages.first ?? "", phoneAction: {//
            
        })
        
    }
}
