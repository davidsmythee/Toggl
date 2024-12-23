//
//  GPTTest.swift
//  Toggl-Part2
//
//  Created by David Smythe on 11/12/24.
//

import SwiftUI

struct QuestionTestView: View {
    @State private var questionData: QuestionData? = nil
    @State private var isLoading = false
    let openAIService = OpenAIService()
    
    var body: some View {
        VStack(spacing: 20) {
            if isLoading {
                ProgressView("Loading Question...")
            } else if let questionData = questionData {
                Text("Question: \(questionData.question)")
                    .font(.headline)
                
                ForEach(questionData.choices.indices, id: \.self) { index in
                    Text("Choice \(index + 1): \(questionData.choices[index])")
                        .padding()
                }
                
                Text("Explanation: \(questionData.explanation)")
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            } else {
                Text("Tap to Fetch a Question")
            }
            
            Button("Fetch Question") {
                isLoading = true
                openAIService.fetchQuestion(for: "SAT Tutor Mode") { fetchedData in
                    DispatchQueue.main.async {
                        self.questionData = fetchedData
                        self.isLoading = false
                    }
                }
            }
            .padding()
        }
        .padding()
    }
}
