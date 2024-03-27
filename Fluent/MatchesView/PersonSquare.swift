//
//  PersonSquare.swift
//  Fluent
//
//  Created by Louise Mostovicz on 26/05/2022.
//

import SwiftUI
import KingfisherSwiftUI

struct PersonSquare: View {
    var person: Person
    var blur: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                KFImage(person.imageURLS.first)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .if(blur) {$0.blur(radius:25)}
                
                Text(person.tlanguages.first ?? "")
                    .padding()
                    .foregroundColor(.white)
                    .font(Font.custom("Dosis-SemiBold",size: 20))
                    .if(blur) {$0.redacted(reason: .placeholder)}

            }
            .cornerRadius(16)
        }
    }
}

struct PersonSquare_Previews: PreviewProvider {
    static var previews: some View {
        PersonSquare(person: Person.example, blur: false)
            .frame(width: 125, height: 125)
    }
}
