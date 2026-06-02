//
//  CardDotted.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 02/06/26.
//

import SwiftUI

struct CardDotted: View {
    
    let selected: Bool
    let height: CGFloat
    let exerciseNumber: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 26)
                .stroke(style:  StrokeStyle(lineWidth: 4,
                                            dash: [4],
                                            dashPhase: 0))
                .frame(width: .infinity, height: height)
//                .overlay(
//                    Text(exerciseNumber)
//                        .frame(width: 30)
//                        .background(Color.red.opacity(0.5))
//                        .position(x: 0, y: 30)
//                )
//                .frame(width: .infinity, height: height)
//                .background(Color.blue.opacity(0.5))
        }
        .overlay(
            Text(exerciseNumber)
                .frame(width: 30)
                .background(Color.red.opacity(0.5))
                .offset(x: 0, y: 0)
        )
    }
}


#Preview {
    VStack(alignment: .leading, spacing: 15) {
        CardDotted(selected: false, height: 62, exerciseNumber: "1")
        CardDotted(selected: true, height: 80, exerciseNumber: "2")
    }
//    .frame(width: 300,height: 400)
}
