//
//  RoundedImage.swift
//  Fluent
//
//  Created by Louise Mostovicz on 21/05/2022.
//

import SwiftUI
import KingfisherSwiftUI

struct RoundedImage: View {
//   use this for opening screen
    var url: URL?
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
        
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: URL(string: "https://picsum.photos/400"))
    }
}
