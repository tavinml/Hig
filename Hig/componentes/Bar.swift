import SwiftUI
import Nuvem

@Observable
class AppModel {
    var lessons: [Lessons.Observable] = []
}

struct Bar: View {
    @State private var telaAtiva: TelaSelecionada? = .licoes
    @State var model = AppModel()
    @State private var isLoadingCloudKit: Bool = false
    
    var body: some View {
        NavigationSplitView {
            Group {
                if isLoadingCloudKit {
                    ProgressView()
                }else{
                    List(selection: $telaAtiva) {
                        
                        NavigationLink(value: TelaSelecionada.licoes) {
                            Label("Lições", systemImage: "books.vertical")
                        }
                        Section("Layout e Tipografia") {
                            NavigationLink(value: TelaSelecionada.hierarquia) {
                                Label("Hierarquia", systemImage: "text.redaction")
                            }
                            NavigationLink(value: TelaSelecionada.alinhamento) {
                                Label("Alinhamento", systemImage: "text.square.filled")
                            }
                            NavigationLink(value: TelaSelecionada.tipografia) {
                                Label("Tipografia", systemImage: "textformat.size")
                            }
                        }
                        //                Section("Cores") {
                        //                    NavigationLink(value: TelaSelecionada.contraste) {
                        //                        Label("Contraste", systemImage: "circle.bottomrighthalf.pattern.checkered")
                        //                    }
                        //                    NavigationLink(value: TelaSelecionada.informacoes) {
                        //                        Label("Informações", systemImage: "text.pad.header")
                        //                    }
                        //                }
                        //
                        //                Section("Materiais") {
                        //                    NavigationLink(value: TelaSelecionada.liquidGlass) {
                        //                        Label("Liquid glass", systemImage: "text.magnifyingglass")
                        //                    }
                        //                    NavigationLink(value: TelaSelecionada.usabilidade) {
                        //                        Label("Usabilidade", systemImage: "hand.rays")
                        //                    }
                        //                }
                }
            }

            }
            .listStyle(.sidebar)
            .navigationSplitViewColumnWidth(min: 120, ideal: 140, max: 160)
            
        } detail: {
            switch telaAtiva {
                
            case .licoes:
                LayoutView()
                
            case .hierarquia:
                SlideView(lesson: model.lessons[0])
                
            case .configuracoes:
                PracticeView(lesson: model.lessons[0])
                
            case .alinhamento:
                SlideView(lesson: model.lessons[1])
                
            case .tipografia:
                SlideView(lesson: model.lessons[2])
                
            case .contraste:
                Text("Tela de contra")
                
            case .informacoes:
                Text("Tela de info")
                
            case .liquidGlass:
                Text("Tela de Liquid Glass")
                
            case .usabilidade:
                Text("Tela de Usabilidade")
                
            case .none:
                Text("oiu")
            }
        }
        .environment(model)
        .task {
            isLoadingCloudKit = true
            do {
                self.model.lessons = try await Lessons.query(on: .default)
                    .with(\.$contents)
                    .with(\.$challenges)
                    .sort(\.$number, order: .ascending)
                    .all()
                    .map(\.observable)
                print(model.lessons.count)
            } catch {
                print(error)
            }
            isLoadingCloudKit = false
        }
    }
}

#Preview {
    Bar()
}
