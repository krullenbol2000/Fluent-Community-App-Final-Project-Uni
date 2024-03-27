//
//  ProfileSwipeCourse.swift
//  Fluent
//
//  Created by Louise Mostovicz on 21/05/2022.
//

import SwiftUI

struct ProfileSwipeCourse: View {
    //add link to setmore booking page
//    make full sentences visible in profile view
    var action: () -> Void

    var body: some View {
        VStack(spacing:0){
            TabView{
                VStack(spacing:9){
                    Text("New courses opening up soon")
                        .font(Font.custom("Lobster-Regular", size: 28))
                        .multilineTextAlignment(.center)
                    
                    Text("Leave your details below and book a FREE level check to learn more!")
                        .font(Font.custom("Dosis-Light", size: 20))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)

                    
                }
                .padding(.bottom, 54)
                VStack(spacing:9){
                    Text("Spanish, French, English or Hebrew?")
                        .font(Font.custom("Lobster-Regular", size: 28))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)


                    
                    Text("If you're learning any of these languages, this is for you!!")
                        .font(Font.custom("Dosis-Light", size: 20))
                        .multilineTextAlignment(.center)

                    
                }
                .padding(.bottom, 54)
            VStack(spacing:9){
                Text("Join Fluent's Immersion Courses:")
                    .font(Font.custom("Lobster-Regular", size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)


                
                Text("Practice with native speakers, get to know the culture and gain confidence through conversations!")
                    .font(Font.custom("Dosis-Light", size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)


                }
                .padding(.bottom, 54)

//                add image of courses
//                why is the text getting stuck?
            }
            .tabViewStyle(PageTabViewStyle())
            Button(action:{ action() }, label: {
                Text("Book a level check and sign up here")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("Dosis-Regular", size: 25))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.2), radius: 10)
                    .padding(.bottom,30)
                
            })
        }
        
    }
}

struct ProfileSwipeCourse_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            ProfileSwipeCourse{
                print("Test")
            }
        }
        .frame(height:400)
    }
}

