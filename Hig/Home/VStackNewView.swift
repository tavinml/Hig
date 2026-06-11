//
//   VStackLayoutView.swift
//  hig_testes
//
//  Created by Ana Soares on 05/06/26.
//

import SwiftUI
import Nuvem

struct VStackNewView: View {
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
                            Card(lesson: lesson)
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
                            Card(lesson: lesson)
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
                            Card(lesson: lesson)
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
    VStackNewView()
}
