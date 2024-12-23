//
//  QuestionsAttemptedView.swift
//  Toggl-Part2
//
//  Created by David Smythe on 12/10/24.
//

import SwiftUI

struct QuestionsAttemptedCell: View {
    let QuestionsAnswered: Int
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 40, height: 80)
                .cornerRadius(20)
                .foregroundStyle(Color(red: 50/255, green: 0/255, blue:180/255))
                .opacity(0.5)
                .shadow(color: .gray, radius: 7)
            
            VStack {
                Text("Questions Answers Correctly: ")
                    .bold()
                HStack {
                    Text("\(QuestionsAnswered)")
                        .font(.system(size: 45))
                        .fontWeight(.bold)
                        .shadow(color:.gray, radius: 7)
                    Text("")
                        .font(.system(size: 30))
                        .bold()
                        .shadow(color:.gray, radius: 7)
                    
                    
                    
                    
                }
                
            }
            
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    QuestionsAttemptedCell(QuestionsAnswered: 56)
}
