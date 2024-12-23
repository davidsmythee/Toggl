//
//  TitleBar.swift
//  Toggl-Part2
//
//  Created by David Smythe on 10/19/24.
//

import SwiftUI

struct TitleBar: View {
    var body: some View {
        HStack {
            Text("Toggl")
                .togglTitle()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 45)
                .font(.system(size: 30))
        }
        
        
        Rectangle()
            .frame(width: UIScreen.main.bounds.width - 40, height: 3)
            .foregroundColor(.gray)
            .padding(.bottom, 20)
    }
}

#Preview {
    TitleBar()
}
