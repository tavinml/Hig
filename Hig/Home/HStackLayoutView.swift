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
    @State var module: Module = .layout
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                GeometryReader { geo in
                    ScrollView(.vertical, showsIndicators: false) {
                        if geo.size.width > 1240 {
                            VStack(alignment: .leading) {
                                
                                switch  module{
                                    
                                case .layout:
                                    VStack(alignment: .leading){
                                        Text(module.title)
                                            .font(.largeTitle)
                                            .bold()
                                            .padding(.leading, 15)
                                        HStack{
                                            ForEach(lessons){ lesson in
                                                let ModuleType = lesson.moduleType
                                                if ModuleType == "layout"{

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
                                case .colors:
                                    VStack(alignment: .leading){
                                        Text(module.title)
                                            .font(.largeTitle)
                                            .bold()
                                            .padding(.leading, 15)
                                        HStack{
                                            ForEach(lessons){ lesson in
                                                let ModuleType = lesson.moduleType
                                                if ModuleType == "colors"{

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
                                        HStack{
                                            ForEach(lessons){ lesson in
                                                let ModuleType = lesson.moduleType
                                                if ModuleType == "materials"{

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
        
    }
}


#Preview {
    HStackLayoutView()
}
