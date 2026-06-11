import SwiftUI

struct BaloonTitle: View {
    var content: Content
    let title: String = "Você sabe o que é hierarquia?"
    let windowWidth: CGFloat 
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {

            Rectangle()
                .fill(Color.colorLayout)
                .frame(width: windowWidth > 1200 ? 40 : 30,
                       height: windowWidth > 1200 ? 40 : 30)
            
            Text(content.title)
                .font(.system(size: windowWidth > 1200 ? 20 : 15))
                .padding(windowWidth > 1200 ? 24 : 18)
                .background(Color.colorLayout)
                .cornerRadius(windowWidth > 1200 ? 24 : 18)
        }
        .foregroundStyle(Color.black)
    }
}
