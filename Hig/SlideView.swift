//
//  Slide.swift
//  Hig
//
//  Created by Bernardo on 02/06/26.
//

import SwiftUI

struct SlideView: View {
    var body: some View {
        GeometryReader { geometry in
            let windowWidth = geometry.size.width
            ZStack{
                HStack(alignment: .center, spacing: windowWidth * 0.05){
                    Image("imageChat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: windowWidth * 0.35)
                        VStack(alignment: .leading, spacing: windowWidth * 0.02){
                        baloonTitle(windowWidth: windowWidth)
                        baloon(windowWidth: windowWidth)
                        
                    }
                    .frame(width: windowWidth * 0.45, alignment: .leading)
                }
                .frame(maxWidth: 1600)
                .padding(40)
                VStack{
                    Spacer()
                    slider(windowWidth: windowWidth)
                }
                .padding(16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
#Preview {
    SlideView()
}
