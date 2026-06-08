//
//  Wrong1.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 05/06/26.
//

import SwiftUI

struct Wrong1: View {
    
    let designWidth: CGFloat = 375
    let designHeight: CGFloat = 812
    
    var body: some View {
        ZStack {
            
            
            Image("Wrong1")
                .resizable()
                .scaledToFit()
//                .frame(width: 375, height: 812)
            
                .overlay(
                    GeometryReader{ geometry in
                        
                    
                        VStack(spacing: 10 /*geometry.size.height  * (10 / designHeight*/) {
                            CardDotted(selected: false, correct: false, height: 30, exerciseNumber: "1")
                            CardDotted(selected: true, correct: false, height: 35, exerciseNumber: "2")
                            CardDotted(selected: false, correct: false, height: 80, exerciseNumber: "3")
                            CardDotted(selected: true, correct: false, height: 70, exerciseNumber: "4")
                            
                            Spacer()
                            
                            CardDotted(selected: true, correct: true, height: 40, exerciseNumber: "5")
                            
                        }
                        
                        .padding(.horizontal, 6)
                        .padding(.vertical, 10)
                    }
                )
                .padding()
            //            .frame(width: 375, height: 812)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    Wrong1()
}
