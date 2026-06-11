//
//  HStackLayoutView.swift
//  hig_testes
//
//  Created by Ana Soares on 05/06/26.
//

import SwiftUI
import Nuvem

struct HStackLayoutView: View {
    @State var lessons: [Lessons.Observable] = []
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                GeometryReader { geo in
                    ScrollView(.vertical, showsIndicators: false) {
                        if geo.size.width > 1240 {
                            VStack(alignment: .leading) {
                                Text("Layout e Tipografia")
                                    .font(.largeTitle)
                                    .bold()
                                    .padding(.leading, 15)
                                HStack {
                                    ForEach(lessons){ lesson in
                                        if(lesson.moduleType == "layout"){
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
                                
                                Text("Cores")
                                    .font(.largeTitle)
                                    .bold()
                                    .padding(.leading, 15)
                                HStack {
                                    ForEach(lessons){ lesson in
                                        if(lesson.moduleType == "colors"){
                                            NavigationLink {
                                                SlideView(lesson: lesson)
                                            } label: {
                                                
                                                Card(lesson: lesson)
                                                    .frame(minWidth: 382)
                                                    .frame(maxHeight: 233)
                                                    .padding(15)
                                            }
                                            
                                        }
                                    }
                                }
                                
                                Text("Materiais")
                                    .font(.largeTitle)
                                    .bold()
                                    .padding(.leading, 15)
                                HStack {
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
                                            
                                        }
                                    }
                                }
                                
                            }
                            .padding(.leading, 15)
                        }
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
    HStackLayoutView()
}
