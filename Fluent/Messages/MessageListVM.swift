//
//  MessageListVN.swift
//  Fluent
//
//  Created by Louise Mostovicz on 22/05/2022.
//

import Foundation
class MessageListVM: ObservableObject{
    @Published var messagePreviews: [MessagePreview] = []
    
    init(){
        loadPreviews()
    }
    
    func loadPreviews(){
        /*handle networking to load message previews from server
        Users.loadData()*/
        self.messagePreviews = MessagePreview.examples
    }
}
