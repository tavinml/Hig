//
//  CardDotted.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 02/06/26.
//

import SwiftUI

struct CardDotted: View {
    
    @State var selected: Bool
    
    let height: CGFloat
    let exerciseNumber: String
    
    var body: some View {
            RoundedRectangle(cornerRadius: 26)
                .stroke(selected ? Color.gray : Color.green,
                        style:  StrokeStyle(lineWidth: 4,
                                            dash: [4],
                                            dashPhase: 0))
                .frame(maxWidth: .infinity )
                .frame(height: height)
//                .overlay(
//                    Text(exerciseNumber)
//                        .frame(width: 30)
//                        .background(Color.red.opacity(0.5))
//                        .position(x: 0, y: 30)
//                )
//                .frame(width: .infinity, height: height)
//                .background(Color.blue.opacity(0.5))
        .overlay(alignment: .topLeading){
            Circle()
                .fill(Color.white)
                .frame(width: 24,height: 24)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                    )
                .overlay(
                    Text(exerciseNumber)
//                        ./*font(.system(size: 12, weight:bold))*/
                        .foregroundStyle(Color.black)
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
        CardDotted(selected: false, height: 62, exerciseNumber: "1")
        CardDotted(selected: true, height: 80, exerciseNumber: "2")
    }
//    .frame(width: 300,height: 400)
}
