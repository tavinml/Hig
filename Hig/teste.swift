
import SwiftUI
import Nuvem

struct AllLessonsView: View {
  
    @State var num: Int = 1
    var body: some View {
        NavigationStack {
                VStack {
                ProgressView("Em andamento...")
            }
        }
    }
}


