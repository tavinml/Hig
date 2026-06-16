//
//  ImageContent.swift
//  Hig
//
//  Created by Ana Soares on 11/06/26.
//
//
//import SwiftUI
//import AppKit
//
//struct ImageContent: View {
//    var content: Content
//    let windowWidth: CGFloat
//    
//    var body: some View {
//         ZStack(alignment: .bottomLeading) {
//            
//            Rectangle()
//                .fill(Color.colorLayout)
//                .frame(width: windowWidth > 1200 ? 40 : 30,
//                       height: windowWidth > 1200 ? 40 : 30)
//            
//             Image(nsImage: content.imageContent ?? content.imageMascot)
//                .padding(windowWidth > 1200 ? 24 : 18)
//                .background(Color.colorLayout)
//                .cornerRadius(windowWidth > 1200 ? 24 : 18)
//        }
//        .foregroundStyle(Color.black)
//    }
//}

//#Preview {
//    ImageContent()
//}
