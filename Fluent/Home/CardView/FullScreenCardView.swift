//
//  FullScreenCardView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 30/05/2022.
//


import SwiftUI

struct FullScreenCardView: View {
    var person: Person
    @Binding var fullscreenMode: Bool
    let screen = UIScreen.main.bounds
    @EnvironmentObject var userMng: UserManager
    var nameSpace: Namespace.ID
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    CardImageScroller(
                        person: person,
                        fullscreenMode: $fullscreenMode)
                        .frame(width: screen.width, height: screen.height * 0.6)
                        .matchedGeometryEffect(id: "image\(person.id)", in: nameSpace)
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(person.name)
                                    .font(Font.custom("Dosis-ExtraBold", size: 40))

                                Text(" speaks \(String(person.nlanguage))")
                                    .font(Font.custom("Dosis-Regular", size: 25))
                                    .padding(.top,10)
                                    .padding(.horizontal,-5)
                                    .lineLimit(1)
                                Spacer()
                            }
                            .opacity(0.75)
                        }
                        .padding([.horizontal, .top], 16)
                        Button(action: { fullscreenMode = false }, label: {
                            Image(systemName: "arrow.down.circle.fill")
                                .font(.system(size: 42))
                                .background(Color.white)
                                .foregroundColor(Color("Blue"))
                                .clipShape(Circle())
                        })
                        .padding(.trailing, 16)
                        .offset(y: -40)
                    }
                    Spacer().frame(height: 26)
                    HStack {
                        Text(person.bio)
                            .font(.system(size: 18, weight: .light))
                            .lineLimit(20)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .opacity(0.75)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                    }
                    Spacer().frame(height: 32)
                    VStack(spacing: 24) {
                        Button(action: {  }, label: {
                            Text("REPORT \(person.name.uppercased())")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.red)
                                .opacity(0.75)
                        })
                    }
                    Spacer().frame(height: 200)
                }
            }
            HStack(spacing: 20) {
                Spacer()
                CircleButtonView(type: .no) {
                    fullscreenMode = false
                    userMng.swipe(person, .nope)

                }
                .frame(height: 50)
                Spacer()
                CircleButtonView(type: .heart) {
                    fullscreenMode = false
                    userMng.swipe(person, .like)
                }
                .frame(height: 50)
                
                Spacer()
            }
            .padding(.top, 25)
            .padding(.bottom, 45)
            .edgesIgnoringSafeArea(.bottom)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.2), Color.white]),
                    startPoint: .top,
                    endPoint: .bottom)
            )
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding(.top, 40)
    }
}
struct FullScreenCardView_Previews: PreviewProvider {
    @Namespace static var placeholder
    
    static var previews: some View {
        FullScreenCardView(person: Person.example, fullscreenMode: .constant(true), nameSpace: placeholder)
    }
}
