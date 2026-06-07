import SwiftUI


            enum TelaSelecionada: Hashable {
                        case home
                        case setings
                        case hierarquia
                        case alinhamento
                        case tipografia
                        case contraste
                        case informacoes
                        case liquidGlass
                        case usabilidade
                    }
                    struct bar: View {
            @State private var telaAtiva: TelaSelecionada? = .home
            var body: some View {
                            NavigationSplitView {
                        
                                    List(selection: $telaAtiva) {
                            
                                        NavigationLink(value: TelaSelecionada.home) {
                                Label("Home", systemImage: "house")
                                }
                                
                                NavigationLink(value: TelaSelecionada.setings) {
                                    Label("Settings", systemImage: "gear")
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
                                
                                Section("Cores") {
                                    NavigationLink(value: TelaSelecionada.contraste) {
                                        Label("Contraste", systemImage: "circle.bottomrighthalf.pattern.checkered")
                                    }
                                    NavigationLink(value: TelaSelecionada.informacoes) {
                                        Label("Informações", systemImage: "text.pad.header")
                                    }
                                }
                                
                                Section("Materiais") {
                                    NavigationLink(value: TelaSelecionada.liquidGlass) {
                                        Label("Liquid glass", systemImage: "text.magnifyingglass")
                                    }
                                    NavigationLink(value: TelaSelecionada.usabilidade) {
                                        Label("Usabilidade", systemImage: "hand.rays")
                                    }
                                }
                            }
                            .listStyle(.sidebar)
                            .navigationSplitViewColumnWidth(min: 120, ideal: 140, max: 160)
                            
                    } detail: {
                    switch telaAtiva {
                        
                    case .home:
                        HomeView()
                        
                    case .hierarquia:
                        SlideView()
                        
                    case .setings:
                        PracticeView()
                        
                    case .alinhamento:
                        Text("Tela de alinha")
                        
                    case .tipografia:
                        Text("Tela de tipo")
                        
                    case .contraste:
                        Text("Tela de contra")
                        
                    case .informacoes:
                        Text("Tela de info")
                        
                    case .liquidGlass:
                        baloon()
                        
                    case .usabilidade:
                        Text("Tela de Usabilidade")
                        
                    case .none:
                        Text("oiu")
                    }
                }
    }
}

#Preview {
    bar()
}
