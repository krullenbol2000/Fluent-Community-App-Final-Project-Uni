//
//  TabBarButtonView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 20/05/2022.
//

import SwiftUI

enum TabBarButtonType: String{
    case feed = "house.fill"
    case meet = "shareplay"
    case star = "star.fill"
    case message = "message.fill"
    case profile = "person.circle.fill"
}
struct TabBarButtonView: View {
    
    var type: TabBarButtonType
    
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        Button( action: {appState.selectedTab = type }, label: {
            //change to communication lofo, not flame
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .if(appState.selectedTab == type, transform: {
                    $0.foregroundColor(type == .star ? Color("Yellow") : Color("Blue"))

                    
                })
                .foregroundColor(Color("Blue").opacity(0.4))
        })
        .frame(height:32)
    }
}

struct TabBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonView(type: .profile).environmentObject(AppStateManager())
        
    }
}
