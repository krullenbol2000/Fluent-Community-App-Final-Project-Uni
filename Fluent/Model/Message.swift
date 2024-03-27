//
//  Message.swift
//  Fluent
//
//  Created by Louise Mostovicz on 21/05/2022.
//

import Foundation

struct Message: Hashable {
    var content: String
    var person: Person? = nil
    
    var fromCurrentUser:Bool{
        return person == nil
    }
    
}

extension Message{
    static let exampleSent = Message(content: "Salut!")
    static let exampleReceived = Message(content: "Comment vas-tu?", person: Person.example)
}
