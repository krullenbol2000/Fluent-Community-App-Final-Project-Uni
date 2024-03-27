//
//  MeetupsMain.swift
//  Fluent
//
//  Created by Louise Mostovicz on 19/05/2022.
//

import SwiftUI

struct MeetupsMain: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    func correctViewForState() -> some View {
    switch appState.selectedTab {
    case.feed:
        let view = PostingView()
        return AnyView(view)
    case.meet:
        let view = HomeView()
    return AnyView(view)
    case .star:
        let view = MatchesView()
    return AnyView(view)
    case.message:
        let view = MessageListView()
    return AnyView(view)
    case.profile:
        let view = ProfileView()
        return AnyView(view)
    }
    }
    var body: some View {
        NavigationView {
            ZStack{
                Color(.systemGray6)
                    .opacity(0.35)
                    .edgesIgnoringSafeArea(.vertical)
                
            
        
        VStack{
            HStack{
//                change for other values, both in tabbarbuttonview and meetupsmain
                Group {
                Spacer()
                TabBarButtonView(type: .feed)
                
                Spacer()
                
                TabBarButtonView(type: .meet)
                Spacer()

                TabBarButtonView(type: .star)
                Spacer()
                
                TabBarButtonView(type: .message)
                Spacer()

                TabBarButtonView(type: .profile)
                }
                Spacer()

            }
            .frame(height: 100)
            .padding(.top, 30)
            correctViewForState()
                Spacer()
                }
        .edgesIgnoringSafeArea(.vertical)
                
                if appState.showPurchasePopup {
                    PurchasePopup(isVisible: $appState.showPurchasePopup)
                        .animation(.spring(response: 0.3, dampingFraction: 0.75, blendDuration: 0.4))
                        .transition(.offset(y:1000))
                }
            }
        .modifier(HideNavigationView())
    
            }
    }
}
        //get out of navigationview!
    


struct MeetupsMain_Previews: PreviewProvider {
    static var previews: some View {
        MeetupsMain()
                .environmentObject(AppStateManager())
                .environmentObject(UserManager())
    }
}

