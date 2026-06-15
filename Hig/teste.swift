import SwiftUI
import Nuvem

struct AllLessonsView: View {
  
    @State var num: Int = 1
    var body: some View {
        NavigationStack {
            Text("coisa linda")
        }
    }
}
#Preview {
    AllLessonsView()
        .frame(width: 300, height: 300)
}
