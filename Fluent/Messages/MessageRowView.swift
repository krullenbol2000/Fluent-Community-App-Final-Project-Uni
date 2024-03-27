//
//  MessageRowView.swift
//  Fluent
//
//  Created by Louise Mostovicz on 25/05/2022.
//

import SwiftUI
import KingfisherSwiftUI

struct MessageRowView: View {
    var preview: MessagePreview
    var body: some View {
        HStack {
            RoundedImage(url: preview.person.imageURLS.first)
                .frame(height:95)
            VStack(alignment: .leading, spacing: 1){
                Text(preview.person.name)
                    .font(Font.custom("Lobster-Regular", size: 25))
                    .foregroundColor(.textTItle)
                Text(preview.person.tlanguages.first ?? "")
//                make the color change according to the language!
                    .font(Font.custom("Dosis-SemiBold", size: 20))
                    .foregroundColor(.textPrimary)
                Text(preview.lastMessage)
                    .foregroundColor(.textSecondary)
                    .lineLimit(1)
            }
            Spacer()
        }
    }
}
struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(preview: MessagePreview.example)
    }
}
