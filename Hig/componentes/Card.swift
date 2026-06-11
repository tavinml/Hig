//
//  Card1.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 01/06/26.
//

import SwiftUI
import Nuvem

struct Card: View {
    @Bindable var lesson: Lessons.Observable
    
    let num: String = "1"
    let title: String = ""
    let imageName: String = ""
    var backgroundColor: Color {
        Module(rawValue: lesson.moduleType)?.colorValue ?? .clear
    }
    
    var body: some View {
                
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Spacer(minLength: 20)
                    
                    Text("Lição \(lesson.number):")
                        .font(.title2)
                        .foregroundStyle(Color.black)
                    
                    Text(lesson.titleLesson)
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color.black)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.leading, 30)
                .padding(.bottom, 40)
                
                Spacer()
                
//                Image(systemName: "Mascote1")
//                    .resizable()
                Image(lesson.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, -10)
                    .frame(maxWidth: 250)
                                
            }
        .frame(minWidth: 382, idealWidth: 382)
        .frame(maxHeight: 233)
        .padding(10)
        .background(backgroundColor)
        .cornerRadius(26)
    }
}


struct Card_Preview: View {
    var body: some View {
        Card(
            lesson: Lessons(
                number: 1,
                image: "cardHierarchy",
                moduleType: "layout",
                challenges: [Challenge()],
                contents: [Content()],
                titleLesson: "Hierarquia"
            ).observable
        )
    }
}

#Preview {
    Card_Preview()

}
