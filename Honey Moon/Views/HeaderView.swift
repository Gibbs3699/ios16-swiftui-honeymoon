//
//  HeaderView.swift
//  Honey Moon
//
//  Created by TheGIZzz on 11/3/2566 BE.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showGuideView: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                print("Infomation!!!!!!")
            }) {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button(action: {
                print("Guide!!!!!!")
                self.showGuideView.toggle()
            }) {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showGuideView: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
