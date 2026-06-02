import SwiftUI

struct bar: View {
    var body: some View {
        
        HStack(alignment: .center, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 8) {
                Label("Home", systemImage: "house")
                Label("settings", systemImage: "gear")
                Text("Layout e Tipografia")
                    .font(.body)
                  .foregroundColor(.white.opacity(0.4))
                Label("Hierarquia", systemImage: "text.redaction")
                Label("Alinhamento", systemImage: "text.square.filled")
                Label("Tipografia", systemImage: "textformat.size")
                
                



                
                Text("Cores")
                    .font(.body)
                  .foregroundColor(.white.opacity(0.4))
                Label("Contraste", systemImage: "circle.bottomrighthalf.pattern.checkered")
                Label("Informações", systemImage: "text.pad.header")

                Text("Materiais")
                    .font(.body)
                  .foregroundColor(.white.opacity(0.4))
                Label("Liquid glass", systemImage: "text.magnifyingglass")
                Label("Usabilidade", systemImage: "hand.rays")
                Spacer()
            }
            .font(Font.title3)
            .padding(10)
            Spacer()
        }


    }
}

#Preview {
    bar()
}
