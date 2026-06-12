//
//  ProgressBar.swift
//  Hig
//
//  Created by Bernardo on 12/06/26.
//

import SwiftUI

struct ProgressBar: View {
    @State private var total: Int = 4
    @State private var slide: Int = 1
    @State private var Next: Bool? = true

    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
                Text("Desafio \(slide)/\(total)")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
            
            GeometryReader { geometry in
                let progressPercentage = CGFloat(slide) / CGFloat(total)
                let calculatedWidth = geometry.size.width * progressPercentage
                
                ZStack(alignment: .leading) {
                    Capsule()
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: geometry.size.width)
                        .frame(height: 24)
                    Capsule()
                        .foregroundColor(.colorLayout)
                        .frame(width: calculatedWidth, height: 24)
                }
                .frame(height: 24)
            }
            .frame(height: 24)
            Button (action: {
                if slide < total { slide += 1}
                else {
                    slide += 0
                }
            }) { if Next == true {
                HStack(alignment: .center) {
                    Image(systemName: "play.fill")
                        .font(Font.title.bold())
                    Text("Próximo")
                        .font(Font.title.bold())
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .background(Color.white)
                .foregroundStyle(Color.black)
                .clipShape(Capsule())
            }; if Next == false {
                HStack(alignment: .center) {
                    Image(systemName: "arrow.clockwise")
                        .font(Font.title.bold())
                    Text("Refazer")
                        .font(Font.title.bold())

                    
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .background(Color.white)
                .foregroundStyle(Color.black)
                .clipShape(Capsule())
            } else {
                EmptyView()
                }
            }
            .buttonStyle(.plain)
        }
        .padding(24)
        .background(Color(red: 0.11, green: 0.11, blue: 0.12))
        .cornerRadius(26)
        
    }
}
#Preview {
    ProgressBar()
}
