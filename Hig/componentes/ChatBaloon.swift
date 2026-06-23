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
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        
        ZStack(alignment: .bottomLeading){
            Rectangle()
                .fill(.backgroundBaloon)
                .frame(width: windowWidth > 1400 ? 40 : 30,
                       height: windowWidth > 1400 ? 35 : 30)
                .background(.backgroundBaloon)
                
            
            HStack(spacing: 6) {
                Text(text)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(windowWidth > 1400 ? .title : .title2)
                    .lineSpacing(windowWidth > 1400 ? 8 : 4)
                    .padding(windowWidth > 1400 ? 4 :2)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(.backgroundBaloon)
                    .cornerRadius(windowWidth > 1400 ? 24 : 18)

                
            }
            .frame(maxWidth: 440, alignment: .leading)
        }
    }
}

//#Preview {
//    ChatBaloon(text: "oiiiii")
//        .frame(width: 400, height: 300)
//}
