
import SwiftUI
import Nuvem

struct LayoutView: View {
    
    @Environment(AppModel.self) var model
    @State private var isLoadingCloudKit: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Group {
                    if isLoadingCloudKit {
                        ProgressView("Carregando Lições")
                    }else{
                        VStack(alignment: .leading) {
                            ForEach(Module.allCases, id: \.self) { module in
                                let moduleLessons = model.lessons.filter { $0.moduleType == module.rawValue }
                                
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
                }
                
            }
        }
    }
}

#Preview {
    LayoutView()
}
