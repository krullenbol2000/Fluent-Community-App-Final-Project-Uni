//
//  User.swift
//  Fluent
//
//  Created by Louise Mostovicz on 25/05/2022.
//

import Foundation


struct User {
    var name: String
    var subscriber: Bool = false
    var imageURLS: [URL] = []
}
extension User {
    
//    http request
    static let example = User(name:"Sara",
                              subscriber: false,
                              imageURLS: [URL( string:"https://picsum.photos/400/323")!])
}
