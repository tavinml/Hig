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
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geo in
            let windowWidth = geo.size.width
            ZStack{
                VStack(alignment: .leading, spacing: windowWidth * 0.02) {
                    Spacer(minLength: 10)
                    
                    Text("Lição \(lesson.number):")
                        .font(.title2)
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                    
                    Text(lesson.titleLesson)
                        .font(.largeTitle.bold())
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
//                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.trailing, windowWidth > 1200 ? 15 : 10)
                .padding(.bottom, 40)
                .offset(x:windowWidth > 1200 ? -100 : -90, y: 10)
    
                
                Spacer()

                Image(lesson.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, -10)
                    .frame(maxWidth: 250)
                    .offset(x: 80, y: 0)
            }
            .frame(minWidth: 382)
            .frame(width: windowWidth * 0.85)
            .padding(10)
            .background(backgroundColor)
            .cornerRadius(26)
        }
        
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
