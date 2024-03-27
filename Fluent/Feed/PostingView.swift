//
//  FeedView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 01/06/2022.
//

import SwiftUI

struct PostingView: View {
    
    @EnvironmentObject var appState: AppStateManager
    @State private var showingPopup = false


    var body: some View {
        VStack{
        FeedView()
            HStack{
                Spacer()
                Button(action: {showingPopup = true }, label: {
            Image(systemName: "square.and.pencil")
                .padding(.vertical, 15)
                .padding(.horizontal, 15)
                .font(Font.custom("Lobster-Regular", size: 45))
                .foregroundColor(.white)
                .background(Color("Yellow"))
                .cornerRadius(50)
                .shadow(color: Color.gray.opacity(0.3), radius: 20)
        })
                
                .popover(isPresented: $showingPopup) {
                    ZStack {
                        Popup()
                        /*Text("Post here:")
                        .frame(width: 200, height: 60)
                        .background(Color("Blue"))
                        .cornerRadius(30.0)*/
                    }
                    
                }
        .buttonStyle(PlainButtonStyle())
        .background(Color.gray.opacity(0))
        .padding(.vertical, -100)
        .padding(.horizontal,30)


    }
            .padding(.horizontal,2)
        }
    }
}
        
struct PostingView_Previews: PreviewProvider {
    static var previews: some View {
        PostingView()
            .environmentObject(AppStateManager())

    }
}

