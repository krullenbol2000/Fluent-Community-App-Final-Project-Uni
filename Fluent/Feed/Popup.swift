//
//  Popup.swift
//  Fluent
//
//  Created by Louise Mostovicz on 09/07/2022.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct Popup: View {
    @State var post: String = ""
    @State private var showingSheet = false

    var body: some View {
        GeometryReader { geo in
        VStack{
            
            HStack {
            Image("userLouise")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
//                            hardcoded, connect to persons and to users
            Text("Louise, Spanish and German").font(.headline)
                    .padding(.horizontal, -20)

            Spacer()
                    
        }
            
        TextField("What do you want to share?", text: $post )
 .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal, 20)
            .font(Font.custom("Dosis-Regular", size: 20))
            .cornerRadius(5.0)
            .padding(.bottom,40)
            HStack{
                Spacer()
                Image(systemName: "link")
                Spacer()
                Image(systemName:"photo")
                Spacer()
                Image(systemName: "video")
                Spacer()
            }
            .font(.system(size: 25)).foregroundColor(.textPrimary)
            .padding(.bottom,20)

            HStack{
                Button(action: {
                    showingSheet.toggle()
                }, label: {Text("Cancel")
                .foregroundColor(.blue)
                    .padding(.horizontal,20)})
                .sheet(isPresented: $showingSheet) {
                    PostingView()
                }

            Button(action: {
                showingSheet.toggle()
            }, label: {Text("Post")
                  .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(Color("Green"))
                    .cornerRadius(15.0)
                .font(.system(size: 20, weight: .regular))})
            .sheet(isPresented: $showingSheet) {
                PostingView()
            }
            }
            
        .frame(width: geo.size.width)
        .padding(.vertical, 20)
        .background(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .foregroundColor(.white)

    }
        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))

    }
}
}
    
struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Popup()
    }
}
