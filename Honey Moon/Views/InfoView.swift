//
//  InfoView.swift
//  Honey Moon
//
//  Created by TheGIZzz on 13/3/2566 BE.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                HStack {
                    Text("Application").foregroundColor(Color.gray)
                    Spacer()
                    Text("Honeymoon")
                }
                
                Text("Get Started!")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                HStack {
                    Text("Photos").foregroundColor(Color.gray)
                    Spacer()
                    Text("Unsplash")
                }
                
                Spacer(minLength: 10)
                
                Button(action: {
                    print("Tapped!!!!!")
                }) {
                    Text("Contonue".uppercased())
                        .modifier(ButtonModifier())
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 15)
            .padding(.horizontal, 25)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
