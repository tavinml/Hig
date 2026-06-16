//
//  Content 2.swift
//  Hig
//
//  Created by Ana Soares on 10/06/26.
//

import Foundation
import CloudKit
import Nuvem
import AppKit

@CKModel
struct Content{
    @CKField("title", default: "")
    var title: String
    @CKField("description", default: "")
    var description: String?
    @CKAssetField("imageContent")
    var imageContent: NSImage?
    @CKAssetField("imageMascot")
    var imageMascot: NSImage
    @CKField("descriptionImage", default: "")
    var descriptionImage: String?
}

import SwiftUI
struct TestView: View {
    @State var contents: [Content.Observable] = []
    var body: some View {
        List {
            ForEach(contents) { content in
                ContentsView(content: content)
            }
        }
        .task {
            do {
                self.contents = try await Content.query(on: .default)
                    .all()
                    .map(\.observable)
            } catch {
                print(error)
            }
        }
    }
}

struct ContentsView: View {
    
    @Bindable var content: Content.Observable
    
    var body: some View {
        HStack {
            Text(content.title)
            Spacer()
            ZStack {
                Rectangle()
                    .foregroundStyle(.quaternary)
 
            }
            .frame(width: 50, height: 50)
            .clipShape(.circle)
        }
    }
    
}

struct ContentsView_Preview: View {
    var body: some View {
        ContentsView(
            content: Content(
                title: "title",
                description: "description",
                imageContent: NSImage(named: "challenge")!,
                imageMascot: NSImage(named: "challenge")!,
                descriptionImage: "description",
            ).observable
        )
    }
}

#Preview {
    ContentsView_Preview()
}
