//
//  Person.swift
//  Fluent
//
//  Created by Louise Mostovicz on 21/05/2022.
//

import SwiftUI
import KingfisherSwiftUI
/*struct Person: Hashable, Identifiable, Decodable{
    var id = UUID().uuidString
    var levels: [String]
}*/


struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var imageURLS: [URL]
    var tlanguages: [String]
    var nlanguage: String
    var bio: String
    //    used for card manipulation

    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0

}


extension Person {
    static let example = Person(
        name: "Ethan",
        imageURLS: [
            URL(string: "https://picsum.photos/400/300")!,
            URL(string: "https://picsum.photos/400/301")!,
            URL(string: "https://picsum.photos/400/302")!,
        ],
        tlanguages: [
            "French",
            "Arabic",
        ],
        nlanguage: "English",
        bio: "My cat niño is the best in the world, he's so funny and stupid. I am a Full-Stack programmer"
    )
    static let example2 = Person(
        name: "Louise",
        imageURLS: [
            URL(string: "https://picsum.photos/400/303")!,
            URL(string: "https://picsum.photos/400/304")!,
            URL(string: "https://picsum.photos/400/305")!
        ],
        tlanguages: [
            "Spanish",
            "German",
        ],
        nlanguage: "French",
        bio: "I love rock-climbing and music"
    )
    static let example3 = Person(
        name: "Tal",
        imageURLS: [
            URL(string: "https://picsum.photos/410/303")!,
            URL(string: "https://picsum.photos/401/304")!,
            URL(string: "https://picsum.photos/420/305")!
        ],
        tlanguages: [
            "German",
            "English",
        ],
        nlanguage: "French",
        bio: "Pistachio ice-cream is the bomb"
    )
    
    static let example4 = Person(
        name: "Noa",
        imageURLS: [
            URL(string: "https://picsum.photos/420/303")!,
            URL(string: "https://picsum.photos/450/304")!,
            URL(string: "https://picsum.photos/430/305")!
        ],
        tlanguages: [
            "Dutch",
            "Hebrew",
        ],
        nlanguage: "English",
        bio: "Bass player? Let's talk!"
    )
    static let examples: [Person] = [
        Person.example,
        Person.example2,
        Person(
            name: "Tom",
            imageURLS: [
                URL(string: "https://picsum.photos/410/306")!,
                URL(string: "https://picsum.photos/410/304")!,
                URL(string: "https://picsum.photos/100/305")!
            ],
            tlanguages: [
                "Hebrew",
                "English",
            ],
            nlanguage: "French",
            bio: "I study psychology"
        ),
        Person(
            name: "Sara",
            imageURLS: [
                URL(string: "https://picsum.photos/400/306")!,
                URL(string: "https://picsum.photos/400/307")!,
                URL(string: "https://picsum.photos/400/309")!
            ],
            tlanguages: [
                "Arabic",
                "Italian",
            ],
            nlanguage: "Hebrew",
            bio: "I own a fancy coffee machine, don't mess with me. If you like cooking, we'll best friends."
        ),
        Person(
            name: "Ron",
            imageURLS: [
                URL(string: "https://picsum.photos/400/311")!,
                URL(string: "https://picsum.photos/400/312")!,
                URL(string: "https://picsum.photos/400/313")!
            ],
            tlanguages: [
                "Spanish",
                "Italian",
            ],
            nlanguage: "Hebrew",
            bio: "I love anything language-related"
            )
        ]
}
    




