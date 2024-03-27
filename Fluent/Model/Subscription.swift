//
//  Subscription.swift
//  Fluent
//
//  Created by Louise Mostovicz on 30/05/2022.
//

import Foundation
struct Subscription: Identifiable {
    let id = UUID()
    var number: Int
    var tagline:TagLine = .none
    
    enum TagLine: String{
        case subscription = "Subscribe to our calendar and receive invitations"
        case joinCourse = "Schedule a level-check and join our courses"
        case joinCommunity = "Become a verified community member"
        case none
    }
    
    

}

extension Subscription {
    static let example1 = Subscription(number: 1, tagline: .subscription)
    static let example2 = Subscription(number: 2, tagline: .joinCourse)
    static let example3 = Subscription(number: 3, tagline: .joinCommunity)

    
}

