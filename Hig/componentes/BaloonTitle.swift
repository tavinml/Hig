import SwiftUI

struct BaloonTitle: View {
    var content: Content
    let windowWidth: CGFloat
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {

            Rectangle()
                .fill(.colorBaloonTitle)
                .background(.colorBaloonTitle)
                .frame(width: windowWidth > 1200 ? 40 : 30,
                       height: windowWidth > 1200 ? 40 : 30)
            
            Text(content.title)
                .font(.title)
                .padding(windowWidth > 1200 ? 24 : 18)
                .background(.colorBaloonTitle)
                .cornerRadius(windowWidth > 1200 ? 24 : 18)
                .foregroundColor(colorScheme == .dark ? .white : .black)
        }
        .foregroundStyle(.colorBaloonTitle)
    }
}
