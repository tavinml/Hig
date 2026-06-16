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
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Rectangle()
                .fill(.colorLayout)
                .frame(width: windowWidth > 1200 ? 40 : 30,
                       height: windowWidth > 1200 ? 40 : 30)
            
            HStack(spacing: 6) {
                if let icon {
                    Image(systemName: icon)
                        .foregroundStyle(iconColor)
                }
                
                Text(text)
                    .font(.title)
                    .foregroundStyle(Color.black)
                    .padding(windowWidth > 1200 ? 24 : 18)
                    .background(Color.colorLayout)
                    .cornerRadius(windowWidth > 1200 ? 24 : 18)
                
            }
            .frame(maxWidth: 440, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(.colorLayout)
            .cornerRadius(24)
        }
    }
}

//#Preview {
//    ChatBaloonTitle(text: "oii", icon: "xmark.circle.fill", iconColor: .cardDotted)
//        .frame(width: 400, height: 300)
//}
