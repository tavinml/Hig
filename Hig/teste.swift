import SwiftUI
import Nuvem

struct AllLessonsView: View {
    @State var lessons: [Lessons.Observable] = []
    @State var num: Int = 1
    var body: some View {
        NavigationStack {
            List {
                ForEach(lessons) { lesson in
                    NavigationLink {
                        SlideView(lesson: lesson)
                    } label: {
                        Text(lesson.titleLesson)
                        Text("\(lesson.number) de\(lesson.contents.count)")
                    }

                }
            }
            .task {
                do {
                    self.lessons = try await Lessons.query(on: .default)
                        .with(\.$contents)
                        .all()
                        .map(\.observable)
                } catch {
                    print(error)
                }
            }
        }
    }
}
#Preview {
    AllLessonsView()
        .frame(width: 300, height: 300)
}
