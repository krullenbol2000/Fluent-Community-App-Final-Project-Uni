//
//  HomeView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 01/06/2022.
//
import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        VStack {
            CardStack(people: userMng.cardPeople)
            
            Spacer()
            
            HStack {
                CircleButtonView(type: .back) {
                    appState.showPurchaseScreen()
                }
                
                Spacer()
                
                CircleButtonView(type: .no) {
                    if let person = userMng.cardPeople.last{ userMng.swipe(person, .nope)
                    }
                }
                Spacer()
                
                CircleButtonView(type: .heart) {
                    if let person = userMng.cardPeople.last {
                        userMng.swipe(person, .like)

                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .lightning) {
                    appState.showPurchaseScreen()
                }
            }
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.vertical, 25)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
