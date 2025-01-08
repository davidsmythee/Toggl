//
//  ChooseAppCell.swift
//  Toggl
//
//  Created by David Smythe on 1/4/25.
//

import Foundation
import SwiftUI

struct ChooseAppCell: View {

    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 290, height: 80)
                .cornerRadius(20)
                .foregroundStyle(Color.green.opacity(0.5))
                .opacity(1)
                .shadow(color: .gray, radius: 3)
            
            ZStack {
                Text("Click to set up Toggl\nwith a different app")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .offset(x: -30)
                
                Image(systemName: "arrow.right")
                    .resizable()
                        .offset(x: 80)
                        .frame(width: 30, height: 20)
                        .foregroundStyle(Color.white)
                        .shadow(color: .white, radius: 1)
                                       
                
                
            }
                
            
        
            
        
//            Button{
//                
//            } label:{
//                
//                    
//                    Image(systemName: "x.circle.fill")
//                        .resizable()
//                        .offset(x: 22, y: 22)
//                        .frame(width: 20, height: 20)
//                        .tint(.red)
//                        .shadow(color: .black, radius: 1)
//                        
//                        
//                }
                
            }
        }
}

#Preview {
    ChooseAppCell()
}

