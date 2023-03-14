//
//  InfoView.swift
//  Honey Moon
//
//  Created by TheGIZzz on 13/3/2566 BE.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                
                Spacer(minLength: 10)
                
                Button(action: {
                    print("Tapped!!!!!")
                    self.presentationMode.wrappedValue.dismiss()
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

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            RowAppInfoView(itemOne: "Application", itemTwo: "HoneyMoon")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone and iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "John/Jane")
            RowAppInfoView(itemOne: "Application", itemTwo: "HoneyMoon")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone and iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "John/Jane")
            RowAppInfoView(itemOne: "Application", itemTwo: "HoneyMoon")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone and iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "John/Jane")
        }
    }
}

struct RowAppInfoView: View {
    var itemOne: String
    var itemTwo: String
    
    var body: some View {
        VStack {
            HStack {
                Text(itemOne).foregroundColor(Color.gray)
                Spacer()
                Text(itemTwo)
            }
            Divider()
        }
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            HStack {
                Text("Photos").foregroundColor(Color.gray)
                Spacer()
                Text("Unsplash")
            }
            
            Divider()
            
            Text("Photos").foregroundColor(Color.gray)
            
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
        }
    }
}
