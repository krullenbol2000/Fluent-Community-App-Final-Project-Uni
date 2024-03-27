//
//  ProfileView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 21/05/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager

    
    var user: User{
        return userMng.currentUser
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            Group {
                ZStack(alignment: .topTrailing) {
                    RoundedImage(url: URL( string:"https://picsum.photos/400/323"))
                        .frame(height: 175)
                    
                    Button(action:{  }, label: {
                        
                        Image(systemName: "pencil")
                            .font(.system(size : 25, weight: .heavy))
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                    })
                    .padding(.vertical,10)
                    .offset(x: -12)
                }
            }
            Spacer().frame(height: 18)
            //            edit accordingly, make dynamic
            Group {
                Text("Louise")
                    .foregroundColor(.textTItle)
                .font(Font.custom("Lobster-Regular", size: 45))
            
            Spacer().frame(height: 5)
            Text("German, Spanish")                .font(Font.custom("Dosis-Medium", size: 30))
            
            Spacer().frame(height: 10)
            HStack (alignment: .top){
                Spacer()
                Button(action: { }, label: {
                    VStack{
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .font(.system(size:30))
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        Text("Settings").font(Font.custom("Dosis-Regular", size: 20))
                            .foregroundColor(.textSecondary)
                    }
                })
                Spacer()
                Button(action: { }, label: {
                    VStack{
                        Image(systemName: "brain.head.profile")
                            .foregroundColor(Color.white)
                            .font(.system(size:38))
                            .padding(22)
                            .background(Color("Blue"))
                            .clipShape(Circle())
                            .shadow(radius: 8)
                        Text("Schedule practice time").font(Font.custom("Dosis-Regular", size: 20))
                            .foregroundColor(.textSecondary)
                    }
                })
                Spacer()

                Button(action: { }, label: {
                    VStack{
                        Image(systemName: "shield.fill")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .font(.system(size:30))
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        Text("Safety").font(Font.custom("Dosis-Regular", size: 20))
                            .foregroundColor(.textSecondary)
                    }
                })
                Spacer()
            }
            
            Spacer().frame(height: 5)
            }
            HStack{
                Text("TIP OF THE DAY: You can't learn without making mistakes")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .foregroundColor(.white)
                    .font(Font.custom("Dosis-ExtraLight", size: 20))
                Button (action: {  } ,label: {
                    Image(systemName: "chevron.forward.circle.fill")
                        .foregroundColor(Color("Purple").opacity(0.8))
                        .font(.system(size:18, weight:.heavy))

                })
                .background(Color.white)
                .clipShape(Circle())
            }
            
            .padding()
            .background(Color("Purple").opacity(0.8))
            .cornerRadius(12)
            .padding(.horizontal, 55)
            
            if !user.subscriber {
                ZStack {
                    Color.gray.opacity(0.14)
                    ProfileSwipeCourse{
                        appState.showPurchaseScreen()
                    }
                }
                .padding(.top, 10)
            }
            Spacer()
            }
        .foregroundColor(Color.black.opacity(0.75))

        }
    }




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(Color.defaultBackground)
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}

