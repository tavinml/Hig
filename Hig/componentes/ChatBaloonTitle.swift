//
//  ChatBaloonTitle.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 16/06/26.
//

import SwiftUI

struct ChatBaloonTitle: View {
    
    let text: String
    let icon: String?
    let iconColor: Color
    let windowWidth: CGFloat
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Rectangle()
                .fill(.colorBaloonTitle)
                .frame(width: windowWidth > 1400 ? 40 : 30,
                       height: windowWidth > 1400 ? 30 : 28)
            
            HStack(alignment: .center) {
               
                if let icon {
                    Image(systemName: icon)
                        .foregroundStyle(iconColor)
                        .font(windowWidth > 1400 ? .title : .title2)
                    
                }
                
                Text(text)
                    .font(windowWidth > 1400 ? .title : .title2)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
//                    .bold()

            }
            .padding(windowWidth > 1400 ? 4 : 2)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(.colorBaloonTitle)
            .cornerRadius(24)
            .frame(maxWidth: 440, alignment: .leading)
            
           
        }
    }
}

//#Preview {
//    ChatBaloonTitle(text: "oii", icon: "xmark.circle.fill", iconColor: .cardDotted)
//        .frame(width: 400, height: 300)
//}
