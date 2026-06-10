//
//  Slide.swift
//  Hig
//
//  Created by Bernardo on 02/06/26.
//

import SwiftUI
import Nuvem

struct SlideView: View {
    @State var lessons: [Lessons.Observable] = []
    
    var body: some View {
        VStack {
            ForEach(lessons, id: \.titleLesson) { lesson in
                if let contents = lesson.contents {
                    ForEach(contents) { content in
                        slideComponent(content: content)
                        Button(){
                            
                        } label:{
                            HStack {
                                Text("Acessar")
                                Image(systemName: "chevron.right")
                            }
                        }
                    }
                } else {
                    Text("TEM NADA")
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
#Preview {
    SlideView()
        .frame(width: 300, height: 300)
}
