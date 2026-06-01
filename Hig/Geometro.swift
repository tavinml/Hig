import SwiftUI
//import GeometryReader

struct ResponsiveView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Responsive UI")
                    .font(.largeTitle)
                    .padding()
                if geometry.size.width > 600 {
                    HStack {
                        Text("This is a large screen")
                        Spacer()
                    }
                } else {
                    VStack {
                        Text("This is a smaller screen")
                        Spacer()
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    ResponsiveView()
}
