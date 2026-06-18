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
    
    @State private var showPractice: Bool = false
    
    private var numberslide: Int {
        return lesson.contents.count
    }
    
    private var LastSlide: Bool {
        index == numberslide - 1
    }
    
    var body: some View {
        
        Group {
            if showPractice {
                PracticeView(lesson: lesson)
            } else {
                GeometryReader { geo in
                    let windowWidth = geo.size.width
                    VStack {
                        let contents = lesson.contents
                        let numSlides = numberslide
                        
                        if index < numberslide {
                            let content = contents[index]
                            SlideComponent(
                                content: content,
                                numSlides: numSlides
                            )
                        }
                        
                        HStack(
                            alignment: .center,
                            spacing: windowWidth > 1200 ? 24 : 16
                        ) {
                            Button(
                                action: {
                                    if index != 0 {
                                        index -= 1
                                    }
                                },
                                label: {
                                    if index == 0 {
                                        Image(systemName: "chevron.left")
                                            .font(windowWidth > 1200 ? .title : .title)
                                            .foregroundColor(Color.gray)
                                    }else{
                                        Image(systemName: "chevron.left")
                                            .font(windowWidth > 1200 ? .title : .title)
                                            .foregroundColor(Color.black)
                                    }
                                })
                            .buttonStyle(.borderless)
                            
                            if LastSlide {
                                Button(
                                    action: {
                                        showPractice.toggle()
                                    },
                                    label: {
                                        Text("Começar a pratica")
                                            .font(windowWidth > 1200 ? .title : .title)
                                            .foregroundColor(.black)
                                            .bold()
                                    })
                                .buttonStyle(.borderless)
                            } else{
                                Text("\(index + 1) de \(numSlides)")
                                    .font(windowWidth > 1200 ? .title : .title)
                            }
                            
                            if !LastSlide {
                                Button(
                                    action: {
                                        index += 1
                                    },
                                    label: {
                                        Image(systemName: "chevron.right")
                                            .font(windowWidth > 1200 ? .title : .title)
                                    })
                                    .buttonStyle(.borderless)
                            } else {
                                Button(
                                    action: {
                                        showPractice.toggle()
                                    },
                                    label: {
                                        Image(systemName: "chevron.right")
                                            .font(windowWidth > 1200 ? .title : .title)
                                        
                                    })
                                    .buttonStyle(.borderless)
                            }
                        }
                        .foregroundStyle(Color.black)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color.colorSlider)
                        .clipShape(Capsule())
                        .padding(.bottom, 30)
                    }
                }
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



