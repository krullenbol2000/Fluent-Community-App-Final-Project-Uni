//
//  AppStateManager.swift
//  Fluent
//
//  Created by Louise Mostovicz on 20/05/2022.
//

import Foundation
import SwiftUI
class AppStateManager: ObservableObject{
    
    @Published var selectedTab: TabBarButtonType = .meet
    @Published var showPersonsProfile: Person? = nil
    @Published var showPurchasePopup: Bool  = false
    
    public func showPersonsProfile(_ person: Person) {
        self.showPersonsProfile = person
    }
    
    public func showPurchaseScreen() {
        self.showPurchasePopup = true
    }

}
