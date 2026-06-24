//
//  LessonButton.swift
//  Hig
//
//  Created by Ana Soares on 16/06/26.
//

import SwiftUI

struct LessonButton: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: LayoutView()) {
                HStack(alignment: .center, spacing: 30) {
                    Image(systemName: "books.vertical")
                        .foregroundColor(.black)
                        .font(Font.title.bold())
                    
                    
                    Text("Lições")
                        .foregroundColor(.black)
                        .font(Font.title.bold())
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .frame(maxWidth: 215, maxHeight: 50)
                .background(.buttonPopUp)
                .cornerRadius(296)
            }
            .buttonStyle(.borderless)
        }
    }
}

#Preview {
    LessonButton()
        .frame(width: 300, height: 300)
}
