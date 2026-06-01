//
//  TesteFrame.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 01/06/26.
//

import SwiftUI

struct TesteFrame: View {
    var window = NSScreen.main?.visibleFrame
    
    var body: some View {
        VStack {
            
            let columns = Array(repeating: GridItem(.flexible(), spacing: 25), count: 3)
            LazyVGrid(columns: columns, spacing: 25) {
                Card1()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 233)
                Card1()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 233)
                Card1()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 233)
            }
//                .frame(maxWidth: .infinity)
//                .frame(maxHeight: 233)
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(style: StrokeStyle(lineWidth: 4, dash: [4], dashPhase: 0))
                    .frame(width: 200, height: 100)
                    .foregroundStyle(Color.red)
//                Text("Toque Aqui")
//                    .foregroundColor(.white)
//                    .frame(width: .infinity, height: .infinity) .padding(.bottom, 70)
//                    .padding(.leading, 100)
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .init(horizontal: .trailing, vertical: .top))

            }
            .onTapGesture {
                print("A área 1 foi tocada!")
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.blue)
                    .frame(width: 200, height: 100)
                
                Text("Toque Aqui")
                    .foregroundColor(.white)
            }
            .onTapGesture {
                print("A área 2 foi tocada!")
            }
        }
    }
}

#Preview {
    TesteFrame()
        .frame(width: 300, height: 420)
}
