//
//  CardDotted.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 02/06/26.
//

import SwiftUI

struct cardDotted: View {
    
    let selected: Bool
    let correct: Bool
    let height: CGFloat
    let exerciseNumber: String
    var onTap: () -> Void  = {}
    
    private var currentColor: Color {
        if selected {
            return correct ? Color.green : Color.red
        } else {
            return .cardDotted
        }
    }
    
    private var icon: String {
       correct ? "checkmark.circle.fill" : "xmark.circle.fill"
    }
    
    var body: some View {
        
        Button {
                     onTap()
                   } label: {
                       RoundedRectangle(cornerRadius: 10)
                       .stroke(currentColor,
                                   style:  StrokeStyle(lineWidth: 4,
                                                       dash: [4],
                                                       dashPhase: 0))
                      
                           .frame(maxWidth: .infinity )
                           .frame(height: height)

                   .overlay(alignment: .topLeading){
                       Circle()
                           .fill(currentColor)
                           .frame(width: 22,height: 22)
                           .overlay(
                               Circle()
                                   .stroke(currentColor, lineWidth: 2)
                               )
                           .overlay(
                               Text(exerciseNumber)
                                   .foregroundStyle(Color.white)
                           )
                           .offset(x: -8, y: -8)
                   }
                   .contentShape(RoundedRectangle(cornerRadius: 26))
                   .onTapGesture(perform: onTap)
                   .animation(.default, value: selected)
                   }
                   .buttonStyle(.borderless)
        
            
        
    }
}


#Preview {
    VStack(alignment: .leading, spacing: 15) {
        cardDotted(selected: true, correct : true, height: 62, exerciseNumber: "1")
        cardDotted( selected: true, correct : false, height: 80, exerciseNumber: "2")
    }

}
