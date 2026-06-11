//
//  Wrong1.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 05/06/26.
//

import SwiftUI

struct MocapComponent: View {
    
    let designWidth: CGFloat = 375
    let designHeight: CGFloat = 812
    
    var body: some View {
        ZStack {
            
            
            //            GeometryReader { geometry in
            ViewThatFits {
                Image("Wrong1")
                    .resizable()
                    .scaledToFit()
                
                    .frame(width: designWidth, height: designHeight)
                
                    .overlay(
                        GeometryReader{ geometry in
                            VStack(spacing: 0) {
                                
                                Color.clear.frame(height: 52)
                                
                                //Ajustar para deixar escalavel
                                
                                cardDotted(selected: false, correct: false, height: 52, exerciseNumber: "1")
                                    .padding(.vertical, 30)
                                
                                
                                cardDotted(selected: true, correct: false, height: 70, exerciseNumber: "2")
                                    .padding(.vertical, -10)
                                
                                
                                cardDotted(selected: false, correct: false, height: 175, exerciseNumber: "3")
                                    .padding(.vertical,25)
                                
                                cardDotted(selected: true, correct: false, height: 75, exerciseNumber: "4")
                                    .padding(.vertical,-9)
                                
                                Spacer()
                                
                                cardDotted(selected: true, correct: true, height: 60, exerciseNumber: "5")
                                    .padding(.vertical,55)
                                
                            }
                            
                            .padding(.horizontal, 6)
                            .padding(.vertical, 10)
                        }
                    )
                    .padding()
            }
            //            }
            //                        .frame(width: 375, height: 812)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MocapComponent()
}


/*geometry.size.height  * (10 / designHeight*/
