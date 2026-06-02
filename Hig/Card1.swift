//
//  Card1.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 01/06/26.
//

import SwiftUI

struct Card1: View {
    
    let lesson: String = "1"
    let title: String = ""
    let backgroundColor: Color = .cardHierarquia
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 26)
                .fill(backgroundColor)
                
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    
                    Text("Lição 1:")
                        .foregroundStyle(Color.black)
                    
                    Text("Hierarquia")
                        .font(Font.body.bold())
                        .foregroundStyle(Color.black)
                }
                .padding(32)
                
                Spacer()
                
//                Image(systemName: "Mascote1")
//                    .resizable()
                Image(.cardMascote)
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 0)
                                   
            }

                
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: 233)
    }
}

#Preview {
        Card1()

}
