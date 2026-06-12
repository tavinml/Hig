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
    var numSlides: Int
    
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
                            if let description = content.description {
                                Baloon(content: content, windowWidth: windowWidth)
                            }
                            if let imageContent = content.imageContent {
                                ZStack(alignment: .bottomLeading) {
                                   
                                   Rectangle()
                                       .fill(Color.white)
                                       .frame(width: windowWidth > 1200 ? 40 : 30,
                                              height: windowWidth > 1200 ? 40 : 30)
                                   
                                    Image(nsImage: content.imageContent ?? content.imageMascot)
                                        .resizable()
                                        .scaledToFit()
                                       .padding(windowWidth > 1200 ? 24 : 18)
                                       .background(Color.white)
                                       .cornerRadius(windowWidth > 1200 ? 24 : 18)
                               }
                               .foregroundStyle(Color.black)
                            }
                    }
                    
                    .frame(width: windowWidth * 0.40, alignment: .leading)
                }
                .frame(maxWidth: 1600)
                .padding(40)
//                VStack(){
//                    Spacer()
//                    Slider(content: content, windowWidth: windowWidth, numSlides: numSlides)
//                }
//                .padding(16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

//struct SlideComponent_Preview: View {
//    var body: some View {
//        SlideComponent(
//            content: Content(
//                title: "title",
//                description: "description",
//                imageContent: NSImage(named: "imageChat")!,
//                imageMascot: NSImage(named: "imageChat")!
//            ),
//            numSlides: numSlides
//        )
//    }
//}
//
//#Preview {
//    SlideComponent_Preview()
//}
