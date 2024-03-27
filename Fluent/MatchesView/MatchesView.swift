//
//  MatchesView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 27/05/2022.
//

import SwiftUI

struct MatchesView: View {
    
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    @State private var selectedTab: LikedTab = .likes
    
    enum LikedTab{
        case likes
        case topPicks
    }
    
    private var buttonText: String{
        if selectedTab == .likes {
            return "See who likes you!"
        } else{
            return "Unlock top picks!"
        }
    }
    private func buttonAction() {
        appState.showPurchaseScreen()
    }
    var body: some View {
        ZStack (alignment: .bottom) {
            VStack (spacing: 0){
                HStack{
                    Spacer()
                    
                    Button(action: { selectedTab = .likes  }, label: { Text("\(userMng.matches.count) Likes")
                            .font(Font.custom("Dosis-Bold", size: 20))
                            .if(selectedTab == .topPicks) {
                                $0.foregroundColor(.textPrimary)}
                    })
                    .buttonStyle(PlainButtonStyle())
                Spacer()
                    Button(action: { selectedTab = .topPicks  }, label: { Text("\(userMng.topPicks.count) Top Picks")
                            .font(Font.custom("Dosis-Bold", size: 20))
                            .if(selectedTab == .likes) {
                                $0.foregroundColor(.textPrimary)}
                    })
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
                Divider()
                    .padding(.vertical, 14)
                
                if (selectedTab == .likes){
                    LikesView()
                } else {
                    TopPicksView()
                }
                Spacer()
            }
            Button(action: { buttonAction() }, label: {
                Text(buttonText)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 36)
                    .font(Font.custom("Lobster-Regular", size: 22))
                    .foregroundColor(.white)
                    .background(Color("Purple"))
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.2), radius: 10)

            })
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom,40)
        }
    }
}

    struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
