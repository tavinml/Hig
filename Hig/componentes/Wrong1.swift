//
//  Wrong1.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 05/06/26.
//

import SwiftUI

struct Wrong1: View {
    var body: some View {
        
        Image("Wrong1")
            .resizable()
            .scaledToFit()
        
            .overlay(
                VStack(spacing:10) {
                    CardDotted(selected: false, correct: false, height: 30, exerciseNumber: "1")
                        .padding(.top, 20)
                    CardDotted(selected: true, correct: false, height: 35, exerciseNumber: "2")
                    CardDotted(selected: false, correct: false, height: 80, exerciseNumber: "3")
                    CardDotted(selected: true, correct: false, height: 70, exerciseNumber: "4")
                    
                    Spacer()
                    
                    CardDotted(selected: true, correct: true, height: 40, exerciseNumber: "5")
                    
                }
                    .padding(.horizontal, 6)
                    .padding(.vertical, 10)
            )
            .padding()
        
    }
}

#Preview {
    Wrong1()
}
