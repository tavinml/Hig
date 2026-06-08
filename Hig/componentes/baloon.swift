//
//  Baloon.swift
//  Hig
//
//  Created by Bernardo on 03/06/26.
//

import SwiftUI
let titleBaloon: String = "Uma hierarquia bem construída organiza o conteúdo,facilita a leitura e melhora a experiência do usuário. Priorize as informações mais relevantes e deixe as secundárias em segundo plano."
struct baloon: View {
    var body: some View {
        
        
        
        
//        GeometryReader { GeometryProxy in
//            ViewThatFits {
//                if GeometryProxy.size.width > 300 {
//                    HStack(spacing: 0) {
//                        Text(titleBaloon)
//                    }
//                    VStack(spacing: 0) {
//                        Text(titleBaloon)
//                    }
//                }
//            }
//            .font(Font.title)
//            .padding(10)
//            .background(Color.red)
//
//
//            
//        }
//        VStack(alignment: .leading, spacing: -1){
//            HStack(alignment: .top, spacing: 0) {
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(minWidth: 16, maxWidth: 16, maxHeight: .infinity)
//                    .background(Color.cardHierarquia)
//                    .cornerRadius(100)
//                Text(titleBaloon)
//                    .foregroundStyle(Color.black)
//                    .font(Font.title)
//                    .padding(.top)
//                    .background(Color.cardHierarquia)
//            }
//            Image("Union")
//                
//        
        Image("chatBubble")
            .resizable()
            .scaledToFit()
            .frame(width: 629, height: 184)
            
               
        }
    }

#Preview {
    baloon()
}
