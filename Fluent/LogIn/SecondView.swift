//
//  SecondView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 09/07/2022.
//

import SwiftUI


struct ErrorView: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
        struct SecondView: View {
            @State public var items: [String] = ["English", "Hebrew", "French","Dutch","Spanish","Italian","German","Yiddish","Russian"]
            @State public var selections: [String] = []

            var body: some View {
                VStack {
                    Form{
                        Text("Pick the language(s) you'd like to learn:")

                      List {
                        ForEach(self.items, id: \.self) { item in
                            ErrorView(title: item, isSelected: self.selections.contains(item)) {
                                if self.selections.contains(item) {
                                    self.selections.removeAll(where: { $0 == item })
                                }
                                else {
                                    self.selections.append(item)
                                }
                            }
                        }
                    }
                        
                    }
                
                NavigationLink(destination: { MainApp() }){
                    Text("Let's start!")
                    }   .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 50)
                        .background(Color("Green"))
                        .cornerRadius(15.0)
                        .font(Font.custom("Lobster-Regular", size: 20))

            }
        
    }
}
        

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
