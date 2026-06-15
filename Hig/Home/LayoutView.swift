
import SwiftUI
import Nuvem

struct LayoutView: View {
    
    @State var lessons: [Lessons.Observable] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(Module.allCases, id: \.self) { module in
                        let moduleLessons = lessons.filter { $0.moduleType == module.rawValue }
                        
                        if !moduleLessons.isEmpty {
                            Text(module.title)
                                .font(.largeTitle)
                                .bold()
                                .padding(.leading, 34)
                                .padding(.top, 5)
                            
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 382), spacing: 0)], spacing: 0) {
                                ForEach(moduleLessons) { lesson in
                                    NavigationLink {
                                        SlideView(lesson: lesson)
                                    } label: {
                                        Card(lesson: lesson)
                                            .frame(minWidth: 382)
                                            .frame(height: 233)
                                            .padding(10)
                                    }
                                    .buttonStyle(.borderless)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .task {
                do {
                    self.lessons = try await Lessons.query(on: .default)
                        .with(\.$contents)
                        .with(\.$challenges)
                        .sort(\.$number, order: .ascending)
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
    LayoutView()
}
