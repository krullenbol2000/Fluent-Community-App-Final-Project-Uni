//
//  MessageThread.swift
//  Fluent
//
//  Created by Louise Mostovicz on 21/05/2022.
//

import Foundation
struct MessagePreview: Hashable{
    var person: Person
    var lastMessage: String
    var language: String
}

extension MessagePreview {
    
    static let example = MessagePreview(person: Person.example, lastMessage: "Comment vas-tu?", language: "French")
    static let examples: [MessagePreview] = [
        MessagePreview(person: Person.example, lastMessage: "Comment vas-tu??", language: "French"),
        MessagePreview(person: Person.example2, lastMessage: "I love Fluent!!", language: "English"),
        MessagePreview(person: Person.example3, lastMessage: "Was geht?", language: "German"),
        MessagePreview(person: Person.example4, lastMessage: "Hoe gaat het?", language: "Dutch")


        
//        should be dynamic and not hard-coded
        
        //MessagePreview(person: Users.users[0], lastMessage: "Comment vas-tu?", language: "French"),
       // MessagePreview(person: Users.users[1], lastMessage: "I am an Industrial Engineering student", language: "English"),
       //s MessagePreview(person: Users.users[2], lastMessage: "Donde estas?", language: "Spanish")


    
    
    
    ]
}
