//
//  slideComponent.swift
//  Hig
//
//  Created by Ana Soares on 09/06/26.
//

import SwiftUI
import AppKit
import Nuvem

struct SlideComponent: View {
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
                            BaloonTitle(content: content, windowWidth: windowWidth)
                            Baloon(content: content, windowWidth: windowWidth)
                        
                    }
                    .frame(width: windowWidth * 0.45, alignment: .leading)
                }
                .frame(maxWidth: 1600)
                .padding(40)
                VStack{
                    Spacer()
                    Slider(windowWidth: windowWidth)
                }
                .padding(16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct SlideComponent_Preview: View {
    var body: some View {
        SlideComponent(
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
    SlideComponent_Preview()
}
