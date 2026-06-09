//
//  WrongView.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 09/06/26.
//

import SwiftUI

struct WrongView: View {
    let areas = try! JSONDecoder().decode(
        [TappableArea].self,
        from: """
            [
              {
                "x":25,
                "y": 75,
                "width": 370.0,
                "height": 62.0
              },
              {
                "x": 25,
                "y": 155,
                "width": 372.0,
                "height": 94.0
              },
              {
                "x": 25,
                "y": 260,
                "width": 372.0,
                "height": 201.0
              },
              {
                "x": 25,
                "y": 490,
                "width": 372.0,
                "height": 127.0
              },
              {
                "x": 25,
                "y": 795,
                "width": 372.0,
                "height": 72.0
              }

            ]
            """
            .data(using: .utf8)!
    )
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            Image("Wrong1")
//                .resizable()
//                .scaledToFit()
            

            ForEach(areas.indices, id: \.self) { index in
                let area = areas[index]
                Button {
                    
                } label: {
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.cardDotted,
                                    style:  StrokeStyle(lineWidth: 4,
                                                        dash: [4],
                                                        dashPhase: 0))
//                            .overlay(
//                                
//                            )
                        
                            .frame(width: area.width,
                                   height: area.height)
                        
                            .shadow(color: .black,
                                    radius: 10)
                    }
                    
                }
                .offset(x: area.x, y: area.y)
            }
        }
//                .frame(width: 300, height: 100)
    }
    
}
#Preview {
    WrongView()
}
