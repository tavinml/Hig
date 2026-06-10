//
//  slideComponent.swift
//  Hig
//
//  Created by Ana Soares on 09/06/26.
//

import SwiftUI
import AppKit
import Nuvem

struct slideComponent: View {
    var content: Content
    var body: some View {
        GeometryReader { geometry in
            let windowWidth = geometry.size.width
            ZStack{
                HStack(alignment: .center, spacing: windowWidth * 0.05){
                    Image(nsImage: content.imageMascot)
                        .resizable()
                        .scaledToFit()
                        .frame(width: windowWidth * 0.35)
                        VStack(alignment: .leading, spacing: windowWidth * 0.02){
                            baloonTitle(content: content, windowWidth: windowWidth)
                            baloon(content: content, windowWidth: windowWidth)
                        
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

struct slideComponent_Preview: View {
    var body: some View {
        slideComponent(
            content: Content(
                title: "title",
                description: "description",
                imageContent: NSImage(named: "imageChat")!,
                imageMascot: NSImage(named: "imageChat")!
            )
        )
    }
}

#Preview {
    slideComponent_Preview()
}
