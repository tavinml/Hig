//
//  NextLessonButton.swift
//  Hig
//
//  Created by Ana Soares on 16/06/26.
//

import SwiftUI

struct NextLessonButton: View {
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: ProgressView("carregando desafios")) {
                HStack(alignment: .center, spacing: 30) {
                    Image(systemName: "play.fill")
                        .foregroundColor(.black)
                        .font(Font.title.bold())
                    
                    
                    Text("Próxima Lição")
                        .foregroundColor(.black)
                        .font(Font.title.bold())
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .frame(maxWidth: 280, maxHeight: 50)
                .background(Color.colorLayout)
                .cornerRadius(296)
            }
            .buttonStyle(.borderless)
        }
    }
}

#Preview {
    NextLessonButton()
}
