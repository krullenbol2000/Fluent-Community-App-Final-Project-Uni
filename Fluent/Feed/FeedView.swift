//
//  PostView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 02/06/2022.
//

import SwiftUI

struct FeedView: View {
    @State var liked1 : Bool = false
    @State var liked2 : Bool = false
    @State var liked3 : Bool = false
    @State var liked4 : Bool = false
    @EnvironmentObject var appState: AppStateManager


//    add +1 for every like
    @State var num: Int = 0
    /*Text(num)
   add +1 for every like*/
    
    
    let screen = UIScreen.main.bounds

    var body: some View {
            //GeometryReader { geometry in
                VStack {
                    List {
                        ScrollView(.horizontal, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 20) {
                            Group {
                                HStack(spacing: 8) {
                                    Image("userLouise")
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
        //                            hardcoded, connect to persons and to users
                                    Text("Louise, Spanish and German").font(.headline)
                                }.padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                            
                            Image("FeedPosts")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 350, height: 300)
                                .clipped()
                            
                            HStack{
                                Button(action: {
                                   self.liked1.toggle()
                                }) {
                                    Image(systemName: self.liked1 == true ? "heart.fill" : "heart")
                                        .renderingMode(.original)
                                          .resizable()
                                          .frame(width: 20, height: 20)
                                          .scaledToFit()

                                }
                            }
                            
                            HStack{
                            Text("Louise")
                                    .font(.headline)
                                    .font(.system(size: 15))

                            Text("Jajaja que buen chiste en #español")
                                .lineLimit(nil)
                                .font(.system(size: 15))
                            }
                                Divider()

                                
                            }
                            Group {
                                HStack(spacing: 8) {
                                   Image("userDaniele")                .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
        //                            hardcoded, connect to persons and to users
                                    Text("Daniele, Dutch and Italian").font(.headline)
                                }.padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                            
                            Image("DFeedPosts")
                                .resizable()
                                .scaledToFill()
                                .frame(width:350, height: 300)
                                .clipped()
                            
                            HStack{
                                Button(action: {
                                   self.liked2.toggle()
                                }) {
                                    Image(systemName: self.liked2 == true ? "heart.fill" : "heart")
                                        .renderingMode(.original)
                                          .resizable()
                                          .frame(width: 20, height: 20)
                                          .scaledToFit()

                                }
                            }
                                
                            
                            HStack{
                            Text("Daniele")
                                    .font(.headline)
                                    .font(.system(size: 15))

                            Text("Wat een grappige mop in het #nederlands")
                                .lineLimit(nil)
                                .font(.system(size: 15))
                            }
                                Divider()
                            }

                            Group {
                                HStack(spacing: 8) {
                                    Image("userYisrael")
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
        //                            hardcoded, connect to persons and to users
                                    Text("Yisrael, Spanish and French").font(.headline)
                                }.padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                            
                            Image("FFeedPosts")
                                .resizable()
                                .scaledToFill()
                                .frame(width:350, height: 300)
                                .clipped()
                            
                            HStack{
                                Button(action: {
                                   self.liked3.toggle()
                                }) {
                                    Image(systemName: self.liked3 == true ? "heart.fill" : "heart")
                                        .renderingMode(.original)
                                          .resizable()
                                          .frame(width: 20, height: 20)
                                          .scaledToFit()

                                }
                            }
                            
                            HStack{
                            Text("Yisrael")
                                    .font(.headline)
                                    .font(.system(size: 15))

                            Text("Vous trouvez la même chose?? #français")
                                .lineLimit(nil)
                                .font(.system(size: 15))
                            }
                            }

                        }
                            

                        .listRowInsets(EdgeInsets())

                        }

                        
                    }
                }
        }
    
    }







struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .environmentObject(AppStateManager())

    }
}
