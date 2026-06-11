//
//  Slide.swift
//  Hig
//
//  Created by Bernardo on 02/06/26.
//

import SwiftUI
import Nuvem

struct SlideView: View {
    let lesson: Lessons.Observable
    @State var index = 0
    
    private var numberslide: Int {
        return lesson.contents?.count ?? 0
    }
    
    var body: some View {
        VStack {
            if let contents = lesson.contents {
                let numSlides = numberslide
                
                if index < numberslide {
                    let content = contents[index]
                    SlideComponent(content: content, numSlides: numSlides)
                }
                else{
                    PracticeView()
                }
                
                Button(action: {
                    nextSlide(numSlides: numSlides)
                },label: {
                    Text("\(index)")
                    Text("\(numSlides)")
                    
                })
                
            }
        }
    }
    
    func nextSlide(numSlides: Int) {
        if index < numSlides{
            index += 1
        }
    }
}

struct Slide_Preview: View {
    var body: some View {
        SlideView(
            lesson: Lessons(
                number: 1,
                image: "cardHierarchy",
                moduleType: "layout",
                challenges: [Challenge()],
                contents: [Content()],
                titleLesson: "Hierarquia"
            ).observable
        )
    }
}

#Preview {
    Slide_Preview()
        .frame(width: 300, height: 300)

}
