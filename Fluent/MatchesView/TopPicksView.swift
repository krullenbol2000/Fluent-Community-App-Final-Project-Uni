//
//  TopPicksView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 27/05/2022.
//

import SwiftUI

struct TopPicksView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    private var user: User {
        return userMng.currentUser
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
        if !user.subscriber{
            Text("Become an official Fluent community member to receive more top picks.")
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .foregroundColor(Color("Yellow"))
                .font(Font.custom("Dosis-Bold", size: 22))
                .padding(.horizontal, 40)
                .padding(.vertical, 24)
        }
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: nil, pinnedViews: [], content: {
            
            ForEach(userMng.matches) { person in PersonSquare(person: person, blur: false)
                    .frame(height:240)
                    .onTapGesture(perform: {
                        personTapped(person)
                    })
            }
        })
        .padding(.horizontal, 6)
        })
    }
    func personTapped(_ person: Person){
        if user.subscriber{
            appState.showPersonsProfile(person)
        } else {
            appState.showPurchaseScreen()
        }
    }
struct TopPicksView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView().environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}

}
