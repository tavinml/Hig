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
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("Layout e Tipografia")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 15)
                    ForEach(lessons){ lesson in
                        if(lesson.moduleType == "layout") {
                            card(lesson: lesson)
                                .frame(minWidth: 382)
                                .frame(maxHeight: 233)
                                .padding(15)
                        }
                    }
                    Text("Cores")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 15)
                    ForEach(lessons){ lesson in
                        if(lesson.moduleType == "colors") {
                            card(lesson: lesson)
                                .frame(minWidth: 382)
                                .frame(maxHeight: 233)
                                .padding(15)
                        }
                    }
                    Text("Materiais")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 15)
                    ForEach(lessons){ lesson in
                        if(lesson.moduleType == "materials"){
                            card(lesson: lesson)
                                .frame(minWidth: 382)
                                .frame(maxHeight: 233)
                                .padding(15)

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
}

#Preview {
    VStackLayoutView()
}
