//
//   VStackLayoutView.swift
//  hig_testes
//
//  Created by Ana Soares on 05/06/26.
//

import SwiftUI
import Nuvem

struct VStackLayoutView: View {
    @State var lessons: [Lessons.Observable] = []
    @State var module: Module = .layout
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                switch module {
                case .layout:
                    VStack(alignment: .leading){
                        Text(module.title)
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 15)
                        ForEach(lessons){ lesson in
                            if(lesson.moduleType == "layout") {
                                NavigationLink {
                                    SlideView(lesson: lesson)
                                } label: {
                                    
                                    Card(lesson: lesson)
                                        .frame(minWidth: 382)
                                        .frame(maxHeight: 233)
                                        .padding(15)
                                }
                                .buttonStyle(.borderless)
                            }
                        }
                    }
                case .colors:
                    Text(module.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 15)
                    ForEach(lessons){ lesson in
                        if(lesson.moduleType == "colors") {
                            NavigationLink {
                                SlideView(lesson: lesson)
                            } label: {
                                
                                Card(lesson: lesson)
                                    .frame(minWidth: 382)
                                    .frame(maxHeight: 233)
                                    .padding(15)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                case .materials:
                    Text(module.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 15)
                    ForEach(lessons){ lesson in
                        if(lesson.moduleType == "materials"){
                            NavigationLink {
                                SlideView(lesson: lesson)
                            } label: {
                                
                                Card(lesson: lesson)
                                    .frame(minWidth: 382)
                                    .frame(maxHeight: 233)
                                    .padding(15)
                            }
                            .buttonStyle(.borderless)

                        }
                    }
                }
                
            }
            .padding(.leading, 15)
            .task {
                do {
                    self.lessons = try await Lessons.query(on: .default)
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
    VStackLayoutView()
}
