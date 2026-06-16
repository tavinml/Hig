//
//  ChatBaloon.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 16/06/26.
//

import SwiftUI

struct ChatBaloon: View {
    
    let text: String
    let windowWidth: CGFloat
    
    var body: some View {
        
        
        ZStack(alignment: .bottomLeading){
            Rectangle()
                .fill(.white)
                .frame(width: windowWidth > 1200 ? 70 : 50,
                       height: windowWidth > 1200 ? 50 : 40)
            
            HStack(spacing: 6) {
                Text(text)
                    .foregroundColor(Color.black)
                    .font(.title)
                    .lineSpacing(windowWidth > 1200 ? 8 : 4)
                    .padding(windowWidth > 1200 ? 28 : 18)
                    .background(Color.backgroundBaloon)
                    .cornerRadius(windowWidth > 1200 ? 24 : 18)
                
            }
            .frame(maxWidth: 440, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(.white)
            .cornerRadius(24)
        }
        
//        Text(text)
//            .font(.body)
//            .foregroundStyle(.black)
//            .frame(maxWidth: 440, alignment: .leading)
//            .padding(.horizontal, 20)
//            .padding(.vertical, 12)
//            .background(.white)
//            .cornerRadius(38)
    }
}

//#Preview {
//    ChatBaloon(text: "oiiiii")
//        .frame(width: 400, height: 300)
//}
