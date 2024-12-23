//
//  SwiftUIView.swift
//  Toggl-Part2
//
//  Created by David Smythe on 10/29/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView{
            
            NavigationLink{
                QuestionView()
            } label:{
                PrimaryButton(text: "Sample Question Page")
                    
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
