//
//  slider.swift
//  Hig
//
//  Created by Bernardo on 08/06/26.
//
import SwiftUI

struct Slider: View {
    
    var content: Content
    var total: Int = 4
    var slide: Int = 1
    let windowWidth: CGFloat
    var numSlides: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: windowWidth > 1200 ? 24 : 16) {

            Image(systemName: "chevron.left")
                .font(windowWidth > 1200 ? .title : .title3)
                .foregroundStyle(Color.gray)
            Text("\(index) de \(total)")
                .font(windowWidth > 1200 ? .largeTitle : .title2)
            Image(systemName: "chevron.right")
                .font(windowWidth > 1200 ? .title : .title3)
                .foregroundColor(Color.black)
        }
        .foregroundStyle(Color.white)
        .padding(.horizontal, windowWidth > 1200 ? 24 : 16)
        .padding(.vertical, windowWidth > 1200 ? 16 : 10)
        .background(.colorBaloon.opacity(0.16))
        .clipShape(Capsule())
        .padding(.bottom, windowWidth > 1200 ? 40 : 16)
    }
    
    
}
//#Preview {
//    slider()
//}
