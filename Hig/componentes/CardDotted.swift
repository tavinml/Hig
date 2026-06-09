//
//  CardDotted.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 02/06/26.
//

import SwiftUI

struct CardDotted: View {
    
    @State var selected: Bool
    
    let correct: Bool
    let height: CGFloat
    @State var exerciseNumber: String
    
    
    private var currentColor: Color {
        if selected {
            return correct ? Color.green : Color.red
        } else {
            return .cardDotted
        }
    }
    
    private var icon: String {
        if correct {
            return  "checkmark.circle"
        } else {
            return "xmark.circle"
        }
    }
    
    var body: some View {
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
                    .frame(width: 24,
                           height: 24)
                
                    .overlay(
                        Circle()
                            .stroke(currentColor,
                                    lineWidth: 2)
                    )
                    .overlay(
                        Text(exerciseNumber)
                        //                        ./*font(.system(size: 12, weight:bold))*/
                            .foregroundStyle(Color.white)
                    )
                    .offset(x: -8, y: -8)
            }
        
            .contentShape(RoundedRectangle(cornerRadius: 26))
            .onTapGesture {
                selected.toggle()
            }
            .animation(.default, value: selected)
        
    }
}


#Preview {
    VStack(alignment: .leading, spacing: 15) {
        CardDotted(selected: false, correct : false, height: 62, exerciseNumber: "1")
        CardDotted( selected: true, correct : false, height: 80, exerciseNumber: "2")
    }
    //    .frame(width: 300,height: 400)
}
