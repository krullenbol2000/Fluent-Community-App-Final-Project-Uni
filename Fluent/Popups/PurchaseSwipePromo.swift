//
//  PurchaseSwipePromo.swift
//  Fluent
//
//  Created by Louise Mostovicz on 30/05/2022.
//

import SwiftUI

struct PurchaseSwipePromo: View {
    var body: some View {
        TabView {
            VStack(spacing: 10) {
                Image(systemName: "bubble.left.and.bubble.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:40)
                Text("5 people you're practicing with are Fluent students")
                    .font(Font.custom("Dosis-Bold", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Blue"))
                Text("Join a course today and receive unlimited access and other benefits")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Dosis-ExtraLight", size: 20))
            }
            .padding(.horizontal, 10)
            VStack(spacing: 10) {
                Image(systemName: "person.3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:40)
                Text("8 people you're practicing with are official community members")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Dosis-Bold", size: 20))
                    .foregroundColor(Color("Orange"))
                Text("Become a verified community member and receive access to exclusive events")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Dosis-ExtraLight", size: 20))
            }
            .padding(.horizontal, 10)
            VStack(spacing: 10) {
                Image(systemName: "calendar.badge.plus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:40)
                Text("Subscribing is free. You should do it too.")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Dosis-Bold", size: 20))
                    .foregroundColor(Color("Red"))
                Text("Subscribe to our monthly calendar and join our weekly events and activities")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Dosis-ExtraLight", size: 20))
            }
            .padding(.horizontal, 10)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
struct PurchaseSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseSwipePromo()
            .frame(height:UIScreen.main.bounds.height/3)
    }
}
