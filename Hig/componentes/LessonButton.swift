//
//  LessonButton.swift
//  Hig
//
//  Created by Ana Soares on 16/06/26.
//

import SwiftUI

struct LessonButton: View {
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            Image(systemName: "books.vertical")
                .foregroundColor(.black)
                .font(Font.title.bold())
               
            
            Text("Lições")
                .foregroundColor(.black)
                .font(Font.title.bold())
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
        .frame(maxWidth: 265, maxHeight: 62)
        .background(.colorLessonButton)
        .cornerRadius(296)
    }
}

#Preview {
    LessonButton()
        .frame(width: 300, height: 300)
}
