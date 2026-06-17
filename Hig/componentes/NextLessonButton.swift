//
//  NextLessonButton.swift
//  Hig
//
//  Created by Ana Soares on 16/06/26.
//

import SwiftUI

struct NextLessonButton: View {
    
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            Image(systemName: "play.fill")
                .foregroundColor(.black)
                .font(Font.title.bold())

            
            Text("Próxima Lição")
                .foregroundColor(.black)
                .font(Font.title.bold())
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
        .frame(maxWidth: 314, maxHeight: 62)
        .background(Color.colorLayout)
        .cornerRadius(296)
    }
}

#Preview {
    NextLessonButton()
}
