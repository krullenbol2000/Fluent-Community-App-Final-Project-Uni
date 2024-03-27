//
//  PurchasePopup.swift
//  Fluent
//
//  Created by Louise Mostovicz on 30/05/2022.
//

import SwiftUI

struct PurchasePopup: View {
    @Binding var isVisible: Bool
    @State private var selectedIndex: Int = 0
    let screen = UIScreen.main.bounds
    let subscriptions: [Subscription] = [
        Subscription.example1,
        Subscription.example2,
        Subscription.example3,
    ]
    func processPayment(){
//        let product = subscriptions[selectedIndex]
    }
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer().frame(height:40)
                VStack{
                    Text("Become an official Fluent member")
                        .foregroundColor(Color("Yellow"))
                        .font(Font.custom("Lobster-Regular", size: 30))
                    PurchaseSwipePromo()
                        .frame(height:geo.size.height/3)
                        .padding(.top, -35)
                    HStack{
                        ForEach(subscriptions.indices) { subIndex in
                            let sub = subscriptions[subIndex]
                            
                            PurchaseOptionView(sub: sub, isSelected: subIndex == selectedIndex)
                                .onTapGesture(perform: {
                                    selectedIndex = subIndex
                                })
                        }
                    }
                    .padding(.horizontal, 15)
                    Spacer()
                    Button(action: {
                    processPayment()
                    }, label: {ZStack {
                        RoundedRectangle(cornerRadius: 45)
                            .foregroundColor(Color("Purple"))
                        Text("CONTINUE")
                            .foregroundColor(.white)
                            .font(Font.custom("Dosis-SemiBold", size: 20))
                    }})
                    .frame(height:48)
                    .padding(.horizontal,40)
                    .padding(.top,12)
                    Button(action: { isVisible = false }, label: {
                        Text("NO THANKS")
                            .foregroundColor(.textPrimary)
                            .font(Font.custom("Dosis-SemiBold", size: 20))
                    })
                    .padding(.vertical,18)
                }
                .frame(width: geo.size.width)
                .padding(.vertical, 20)
                .background(RoundedRectangle(cornerRadius: 25, style: .continuous)
                .foregroundColor(.white))
               Spacer()
                VStack {
                    Text("Cancel anytime")
                        .foregroundColor(.white)
                        .font(.system (size:14, weight: .semibold))
                    Text("Example text to represent legal documentation. This text is temp and will be changed once the app is launched and verified by the legal team at Fluent.")
                        .foregroundColor(Color.white.opacity(0.5))
                        .font(.system(size:14, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 4)
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .frame(height: screen.height)
    }
}
struct PurchasePopup_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePopup(isVisible: .constant(true))
    }
}
