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
                            SlideComponent(content: content, numSlides: numSlides)
                        }
                        
                        HStack(alignment: .center, spacing: windowWidth > 1200 ? 24 : 16) {
                            Button(action: {
                                if index != 0 {
                                    index -= 1
                                }
                            }, label: {
                                if index == 0 {
                                    Image(systemName: "chevron.left")
                                        .font(windowWidth > 1200 ? .title : .title3)
                                        .foregroundColor(Color.gray)
                                }else{
                                    Image(systemName: "chevron.left")
                                        .font(windowWidth > 1200 ? .title : .title3)
                                        .foregroundColor(Color.black)
                                }
                            })
                            .buttonStyle(.borderless)
                            
                            if LastSlide {
                                Button(action: {
                                    showPractice.toggle()
                                } , label: {
                                    Text("Começar a pratica")
                                        .font(windowWidth > 1200 ? .largeTitle : .title3)
                                        .foregroundColor(.black)
                                        .bold()
                                })
                                .buttonStyle(.borderless)
                            } else{
                                Text("\(index + 1) de \(numSlides)")
                                    .font(windowWidth > 1200 ? .largeTitle : .title3)
                            }
                            
                            if !LastSlide {
                                Button(action: {
                                    index += 1
                                }, label: {
                                    Image(systemName: "chevron.right")
                                        .font(windowWidth > 1200 ? .largeTitle : .title3)
                                        
                                })
                                .buttonStyle(.borderless)
                            } else {
                                Image(systemName: "chevron.right")
                                    .font(windowWidth > 1200 ? .largeTitle : .title3)
                            }
                            
//                            if index < numSlides - 1 {
//                                Text("\(index + 1) de \(numSlides)")
//                                    .font(windowWidth > 1200 ? .largeTitle : .title2)
//                            }else{
//                                Text("Começar a Praticar")
//                                    .font(windowWidth > 1200 ? .largeTitle : .title2)
//                            }
                            
//                            Button(action: {
//                                if index < numSlides{
//                                    index += 1
//                                }
//                            }, label: {
//                                Image(systemName: "chevron.right")
//                                    .font(windowWidth > 1200 ? .title : .title3)
//                                    .foregroundColor(Color.black)
//                            })
//                            .buttonStyle(.borderless)
                            
                        }
                        .foregroundStyle(Color.black)
                        .padding(.horizontal, windowWidth > 1200 ? 22 : 16)
                        .padding(.vertical, windowWidth > 1200 ? 16 : 10)
                        .background(Color.colorSlider)
                        .clipShape(Capsule())
                        .padding(.bottom, windowWidth > 1200 ? 30 : 18)
                    }

                }
            }
        }
        
//        GeometryReader { geo in
//            let windowWidth = geo.size.width
//            VStack {
//                let contents = lesson.contents
//                let numSlides = numberslide
//                
//                if index < numberslide {
//                    let content = contents[index]
//                    SlideComponent(content: content, numSlides: numSlides)
//                }
//                else{
//                    PracticeView(lesson: lesson)
//                }
//                HStack(alignment: .center, spacing: windowWidth > 1200 ? 24 : 16) {
//                    Button(action: {
//                        if index != 0 {
//                            index -= 1
//                        }
//                    }, label: {
//                        if index == 0 {
//                            Image(systemName: "chevron.left")
//                                .font(windowWidth > 1200 ? .title : .title3)
//                                .foregroundColor(Color.gray)
//                        }else{
//                            Image(systemName: "chevron.left")
//                                .font(windowWidth > 1200 ? .title : .title3)
//                                .foregroundColor(Color.black)
//                        }
//                    })
//                    .buttonStyle(.borderless)
//                    if index < numSlides - 1 {
//                        Text("\(index + 1) de \(numSlides)")
//                            .font(windowWidth > 1200 ? .largeTitle : .title2)
//                    }else{
//                        Text("Começar a Praticar")
//                            .font(windowWidth > 1200 ? .largeTitle : .title2)
//                    }
//                    
//                    Button(action: {
//                        if index < numSlides{
//                            index += 1
//                        }
//                    }, label: {
//                        Image(systemName: "chevron.right")
//                            .font(windowWidth > 1200 ? .title : .title3)
//                            .foregroundColor(Color.black)
//                    })
//                    .buttonStyle(.borderless)
//                    
//                }
//                .foregroundStyle(Color.black)
//                .padding(.horizontal, windowWidth > 1200 ? 24 : 16)
//                .padding(.vertical, windowWidth > 1200 ? 16 : 10)
//                .background(Color.white)
//                .clipShape(Capsule())
//                .padding(.bottom, windowWidth > 1200 ? 40 : 16)
////                    Button(action: {
////                        nextSlide(numSlides: numSlides)
////                    },label: {
////                        Text("\(index)")
////                        Text("\(numSlides)")
////
////                    })
//                
//            }
//        }
        
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



