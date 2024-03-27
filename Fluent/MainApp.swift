//
//  ContentView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 20/05/2022.
//

import SwiftUI

struct MainApp: View {
    @ObservedObject var mng: AppStateManager = AppStateManager()
    @ObservedObject var userMng: UserManager = UserManager()

    var body: some View {
        MeetupsMain()
            .environmentObject(mng)
            .environmentObject(userMng)
            .modifier(HideNavigationView())

    }
    
}

struct MainApp_Previews: PreviewProvider {
    static var previews: some View {
        MainApp()
    }
}
