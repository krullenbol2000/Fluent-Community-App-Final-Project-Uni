//
//  MessageView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 21/05/2022.
//

import SwiftUI

struct MessageView: View {
    var message:Message
    var body: some View {
        HStack{
            if message.fromCurrentUser{
                Spacer()
            }
            Text(message.content)
                .padding(10)
                .foregroundColor(.white)
                .background(message.fromCurrentUser ? Color.gray.opacity(0.75) :Color("Blue").opacity(0.8))
                .cornerRadius(10)
            if !message.fromCurrentUser{
                Spacer()
            }
        }
        .padding()
    }
}
struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message:Message.exampleReceived)
    }
}
