import SwiftUI

struct Baloon: View {
    var content: Content
    let baloonContent: String = "Uma hierarquia bem construída organiza o conteúdo, facilita a leitura e melhora a experiência do usuário. Priorize as informações mais relevantes e deixe as secundárias em segundo plano."
    let windowWidth: CGFloat
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(.colorBackgroundBaloon)
                .frame(width: windowWidth > 1200 ? 70 : 50,
                       height: windowWidth > 1200 ? 50 : 40)
            
            Text(content.description ?? baloonContent)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.title)
                .lineSpacing(windowWidth > 1200 ? 8 : 4)
                .padding(windowWidth > 1200 ? 28 : 18)
                .background(.colorBackgroundBaloon)
                .cornerRadius(windowWidth > 1200 ? 24 : 18)
        }
        
//        .foregroundStyle(.colorBaloon.opacity(0.16))
        
    }
}
