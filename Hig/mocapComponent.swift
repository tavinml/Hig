//
//  WrongView.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 09/06/26.
//

import SwiftUI

struct WrongView: View {
    
    let correctIndex: Int
    let imageChallenge: String
    
    @State var correctsIndex:[Int]
    
    
    @State private var selectedIndex: Int? = nil
    
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
            Image(imageChallenge)
//                .resizable()
//                .scaledToFit()
            

            ForEach(areas.enumerated(), id: \.offset) { index, area in
                Button {
                    
                } label: {
                    CardDotted(selected: selectedIndex == index,
                               correct: index == correctIndex,
                               height: area.height,
                               width: area.width,
                               exerciseNumber: "\(index + 1)")
                        .frame(width: area.width)
                        
                    
//                    ZStack(alignment: .topLeading) {
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.cardDotted,
//                                    style:  StrokeStyle(lineWidth: 4,
//                                                        dash: [4],
//                                                        dashPhase: 0))
//                            .overlay(alignment: .topLeading){
//                                
//                                Circle()
//                                    .fill(.cardDotted)
//                                    .frame(width: 24,
//                                           height: 24)
//                                
//                                    .overlay(
//                                        Circle()
//                                            .stroke(.cardDotted,
//                                                    lineWidth: 2)
//                                    )
//                                    .overlay(
//                                        Text("1")
//                                        //                        ./*font(.system(size: 12, weight:bold))*/
//                                            .foregroundStyle(Color.white)
//                                    )
//                                    .offset(x: -8, y: -8)
//                            }
//                        
//                            .frame(width: area.width,
//                                   height: area.height)
//                        
////                            .shadow(color: .black,
////                                    radius: 10)
//                    }
                    
                }
                .offset(x: area.x, y: area.y)
//                .onTapGesture {
//                    if selectedIndex == index {
//                        selectedIndex = nil
//                    } else {
//                        selectedIndex = index
//                    }
//                }
            }
        }
//                .frame(width: 300, height: 100)
    }
    
}
#Preview {
    WrongView(correctIndex: 4, imageChallenge: "Wrong1", correctsIndex: [])
}
