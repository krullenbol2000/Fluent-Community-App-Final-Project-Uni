//
//  ChatView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 21/05/2022.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatMng: ChatManager
    @State private var typingMessage: String = ""
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    private var person: Person
    
    init(person: Person){
        self.person = person
        self.chatMng = ChatManager(person: person)
    }
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer().frame(height: 95)
                ScrollView(.vertical, showsIndicators: false, content: {
                    ScrollViewReader { proxy in
                        LazyVStack{
                            ForEach(chatMng.messages.indices, id: \.self) {index in let msg = chatMng.messages[index]
                                MessageView(message: msg)
                                    .id(index)
                                    .animation(.easeIn)
                                    .transition(.move(edge:.trailing))
                            }
                        }
                        .onAppear(perform: {
                            scrollProxy = proxy
                        })
                    }
                })
                ZStack (alignment: .trailing) {
                    Color.textfieldBG
                    TextField("Type a message...", text: $typingMessage)
                                        .foregroundColor(Color.textPrimary)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .frame(height: 45)
                                    .padding(.horizontal)
                    Button(action: {sendMessage()}, label: {
                        Text("Send")
                    })
                    .padding(.horizontal)
                    .foregroundColor(typingMessage.isEmpty ? Color.textPrimary : Color.blue)
                                    
                }
                .frame(height:40)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                .padding(.horizontal)
                .padding(.vertical)



                
            }
            ChatViewHeader(name: person.name, imageURL: person.imageURLS.first, tlanguage: person.tlanguages.first ?? "") {//
                
            }
            .padding(.vertical,30)
        }
        .modifier(HideNavigationView())
        .onChange(of: chatMng.keyboardIsShowing, perform: { value in if value{
            scrollToBottom()
        }
            
        })
        
        .onChange(of: chatMng.messages, perform: {_ in scrollToBottom()
            
        })

    
    }
    
    func sendMessage(){
        chatMng.sendMessage(message: Message(content: typingMessage))
        typingMessage = ""
    }
    func scrollToBottom() {
        withAnimation {
            scrollProxy?.scrollTo(chatMng.messages.count - 1, anchor: .bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}
