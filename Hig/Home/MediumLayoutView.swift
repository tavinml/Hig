//
//  MediumLayoutView.swift
//  hig_testes
//
//  Created by Ana Soares on 05/06/26.
//

import SwiftUI
import Nuvem

struct MediumLayoutView: View {
    @State var lessons: [Lessons.Observable] = []
    @State var module: Module = .layout
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                GeometryReader { geo in
                    ScrollView(.vertical) {
                        
                        if geo.size.width <= 1240 {
                            VStack(alignment: .leading) {
                                switch module {
                                case .layout:
                                    VStack(alignment: .leading){
                                        Text(module.title)
                                            .font(.largeTitle)
                                            .bold()
                                            .padding(.leading, 15)
                                        
                                        HStack {
                                            ForEach(lessons.indices.prefix(2), id: \.self) { index in
                                                if(lessons[index].moduleType == "layout") {
                                                    NavigationLink {
                                                        SlideView(lesson: lessons[index])
                                                    } label: {
                                                        
                                                        Card(lesson: lessons[index])
                                                            .frame(minWidth: 382)
                                                            .frame(maxHeight: 233)
                                                            .padding(15)
                                                    }
                                                    .buttonStyle(.borderless)
                                                }
                                            }
                                        }
                                        
                                        if lessons.count > 3 {
                                            if(lessons[3].moduleType == "layout") {
                                                Card(lesson: lessons[3])
                                                    .frame(minWidth: 382, minHeight: 233)
                                                    .padding(15)
                                            }
                                        }
                                    }
                                case .colors:
                                    VStack(alignment: .leading){
                                        Text(module.title)
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
                                                    .buttonStyle(.borderless)
                                                    
                                                }
                                            }
                                        }
                                    }
                                case .materials:
                                    VStack(alignment: .leading){
                                        Text(module.title)
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
                                                    .buttonStyle(.borderless)
                                                }
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
    MediumLayoutView()
}
