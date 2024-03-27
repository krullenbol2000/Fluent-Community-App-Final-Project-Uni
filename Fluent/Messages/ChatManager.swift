//
//  ChatManager.swift
//  Fluent
//
//  Created by Louise Mostovicz on 21/05/2022.
//

import Foundation
import Combine
import UIKit

class ChatManager: ObservableObject{
    @Published var messages: [Message] = []
    @Published var keyboardIsShowing: Bool = false
    var cancellable: AnyCancellable? = nil
    private var person: Person
    init(person: Person){
        self.person = person
        loadMessages()
        setupPublishers()
    }
    public func sendMessage( message: Message){
//        connect to back end here!!!!
//        this is temp and local
        messages.append(message)
        //if networking error, show failure with some rety options
    }
    
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map ({ _ in true})
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map ({ _ in false})
    
    private func setupPublishers(){
        cancellable = Publishers.Merge(keyboardWillShow,keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    private func loadMessages(){
       messages = [Message.exampleSent, Message.exampleReceived]
    }
    deinit {
        cancellable?.cancel()
    }
}
