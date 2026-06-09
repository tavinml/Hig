import SwiftUI

struct baloonTitle: View {
    let title: String = "Você sabe o que é hierarquia?"
    let windowWidth: CGFloat // Recebe a largura vindo da SlideView
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {

            Rectangle()
                .fill(Color.cardLayout)
                .frame(width: windowWidth > 1200 ? 40 : 30,
                       height: windowWidth > 1200 ? 40 : 30)
            
            Text(title)
                .font(.system(size: windowWidth > 1200 ? 20 : 15))
                .padding(windowWidth > 1200 ? 24 : 18)
                .background(Color.cardLayout)
                .cornerRadius(windowWidth > 1200 ? 24 : 18)
        }
        .foregroundStyle(Color.black)
    }
}
