//
//  PurchaseOptionView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 30/05/2022.
//

import SwiftUI

struct PurchaseOptionView: View {
    var sub:Subscription
    var isSelected: Bool
    var body: some View {
        VStack (spacing: 0){
            Text("Option \(sub.number)")
                .font(.system(size:18, weight: .bold))
                .multilineTextAlignment(.center)
            Spacer().frame(height:2)
            Text("\(sub.tagline.rawValue)")
                .if(isSelected) {
                    $0.font(.system(size: 15, weight: .semibold))
                }
                .multilineTextAlignment(.center)
                .font(.system(size:15, weight: .light))
                .lineLimit(3)
                .foregroundColor(.textPrimary)
                .padding(.top, 2)
                .padding(.horizontal, 6)
                .minimumScaleFactor(0.1)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 18)
        .if(!isSelected) {
            $0.foregroundColor(Color.textPrimary)
        }
        .if(isSelected) {
            $0.overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color("Yellow"), lineWidth: 1.5)
            )
        }
    }
}
struct PurchaseOptionView_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
        PurchaseOptionView(sub: Subscription.example1, isSelected: false)
        PurchaseOptionView(sub: Subscription.example2, isSelected: true)
        PurchaseOptionView(sub: Subscription.example3, isSelected: false)
    }
}
}
