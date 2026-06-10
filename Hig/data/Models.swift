//
//  Models.swift
//  Hig
//
//  Created by Ana Soares on 08/06/26.
//

import Foundation
import CloudKit
import Nuvem

@CKModel
struct Lessons{
    @CKField("number")
    var number: Int
    @CKField("image")
    var image: String
    @CKField("moduleType")
    var moduleType: String
    @CKField("challenges")
    var challenge: [String]?
    @CKField("contents")
    var content: [String]?
    @CKField("titleLesson")
    var titleLesson: String
}

@CKModel
struct Challenge{
    @CKField("correctSection")
    var correctSection: Int
    @CKField("correctFeedback")
    var correctFeedback: String
    @CKField("wrongFeedback")
    var wrongFeedback: String
    @CKField("firstBallon")
    var firstBallon: String
    @CKField("secondBallon")
    var secondBallon: String?
    @CKField("imageChallenge")
    var imageChallenge: String
    @CKField("titleChallenge")
    var titleChallenge: String
    @CKField("titleCorrect")
    var titleCorrect: String
    @CKField("titleWrong")
    var titleWrong: String
    @CKField("areas")
    var area: Areas
}

@CKModel
struct Content{
    @CKField("title")
    var title: String
    @CKField("description")
    var description: String?
    @CKField("imageContent")
    var imageContent: String
    @CKField("imageMascot")
    var imageMascot: String
}

struct Areas: CKCodable {
    let values: [TappableArea]
}

struct TappableArea: Codable {
    let x: Double
    let y: Double
    let width: Double
    let height: Double
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
                imageContent: "image Content",
                imageMascot: "challenge"
            ).observable
        )
    }
}

#Preview {
    ContentsView_Preview()
}
