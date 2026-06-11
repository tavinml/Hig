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
                    SlideComponent(content: content)
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

struct AllLessonsView: View {
    @State var lessons: [Lessons.Observable] = []
        
    var body: some View {
        NavigationStack {
            List {
                ForEach(lessons) { lesson in
                    NavigationLink {
                        SlideView(lesson: lesson)
                    } label: {
                        Text(lesson.titleLesson)
                        Text("\(lesson.contents?.count)")
                    }

                }
            }
            .task {
                do {
                    self.lessons = try await Lessons.query(on: .default)
                        .with(\.$contents)
                        .all()
                        .map(\.observable)
                } catch {
                    print(error)
                }
            }
        }
    }
}
#Preview {
    AllLessonsView()
        .frame(width: 300, height: 300)
}
