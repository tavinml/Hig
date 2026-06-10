import SwiftUI

struct baloon: View {
    var content: Content
    let baloonContent: String = "Uma hierarquia bem construída organiza o conteúdo, facilita a leitura e melhora a experiência do usuário. Priorize as informações mais relevantes e deixe as secundárias em segundo plano."
    let windowWidth: CGFloat
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(Color.white)
                .frame(width: windowWidth > 1200 ? 70 : 50,
                       height: windowWidth > 1200 ? 50 : 40)
            
            Text(content.description ?? baloonContent)
                .font(.system(size: windowWidth > 1200 ? 20 : 15))
                .lineSpacing(windowWidth > 1200 ? 8 : 4)
                .padding(windowWidth > 1200 ? 28 : 18)
                .background(Color.white)
                .cornerRadius(windowWidth > 1200 ? 24 : 18)
        }
        .foregroundStyle(Color.black)
    }
}
