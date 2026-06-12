//
//  SwiftUIView.swift
//  Hig
//
//  Created by Ana Soares on 12/06/26.
//

import SwiftUI
import Nuvem

struct LayoutView: View {
    
    @State var lessons: [Lessons.Observable] = []
    @State var module: Module = .layout
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading){
                    Text(module.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 15)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 380), spacing: 10)], spacing: 10) {
                        ForEach(lessons) { lesson in
                            let ModuleType = lesson.moduleType
                            if ModuleType == "layout"{

                                NavigationLink {
                                    SlideView(lesson: lesson)
                                } label: {
                                    Card(lesson: lesson)
                                        .frame(minWidth: 382)
                                        .frame(height: 233)
                                        .padding(15)
                                }
                                .buttonStyle(.borderless)
                                
                            }
                        }
                    }
                    .padding()
                }
            }
            .task {
                do {
                    self.lessons = try await Lessons.query(on: .default)
                        .with(\.$contents)
                        .sort(\.$number, order: .ascending)
                        .all()
                        .map(\.observable)
                    print(lessons.count)
                } catch {
                    print(error)
                }
            }
        }
    }
}

#Preview {
    LayoutView()
}
