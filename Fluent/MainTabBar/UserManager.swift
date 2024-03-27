//
//  UserManager.swift
//  Fluent
//
//  Created by Louise Mostovicz on 25/05/2022.
//

import Foundation


class UserManager: ObservableObject{
    @Published var currentUser : User = User(name: "")
    @Published var matches : [Person] = []
    @Published var topPicks : [Person] = []
    @Published var cardPeople: [Person] = []



init() {
    loadUser()
    loadMatches()
    loadTopPicks()
    loadCardPeople()
}
    private func loadCardPeople() {
        self.cardPeople = Person.examples
    }
    
    private func loadTopPicks() {
        self.topPicks = Person.examples.shuffled()
    }
    
    private func loadUser() {
        self.currentUser = User.example
    }
    
    private func loadMatches() {
        self.matches = Person.examples
    }
    
    public func swipe(_ person: Person, _ direction: SwipeDirection) {
        cardPeople.removeLast()
        // Networking to backend
    }
    
    public func superLike(_ person: Person) {
        cardPeople.removeLast()
        // Networking to backend
    }

}

enum SwipeDirection {
case like
case nope
}
    
    /*private func loadUsers() {
        Users.loadData()
        while (Users.users.count == 0 ){
            Thread.sleep(forTimeInterval: 0.1)
        }
    }
    
    
    private func loadCardPeople() {
        self.cardPeople = Users.users
    }

    
    private func loadTopPicks() {
        self.topPicks = Users.users.shuffled()
    }

    

private func loadUser() { 
    
//    networking
    self.currentUser = User.example
}
    
    private func loadMatches() {
        self.matches = Users.users
    }
    
    public func swipe(_ person: Person, _ direction: SwipeDirection) {
        cardPeople.removeLast()
        // Networking to backend
    }
    
    public func superLike(_ person: Person) {
        cardPeople.removeLast()
        // Networking to backend
    }
     
    
}*/
    
 



