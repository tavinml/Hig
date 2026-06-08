//
//  Card1.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 01/06/26.
//

import SwiftUI

struct card: View {
    
    let lesson: String = "1"
    let title: String = ""
    let backgroundColor: Color = .cardLayout
    
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: 26)
//                .fill(backgroundColor)
                
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    
                    Text("Lição 1:")
                        .font(Font.title2)
                        .foregroundStyle(Color.black)
                    
                    Text("Hierarquia")
                        .font(Font.largeTitle.bold())
                        .foregroundStyle(Color.black)
                }
                .padding(.leading, 30)
                .padding(.bottom, 30)
                
                Spacer()

                Image(.cardMascote)
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, -10)
                                   
            }

                
        }
        .frame(minWidth: 382)
        .frame(maxHeight: 233)
        .padding(10)
        .background(backgroundColor)
        .cornerRadius(26)
    }
}

#Preview {
        card()

}
