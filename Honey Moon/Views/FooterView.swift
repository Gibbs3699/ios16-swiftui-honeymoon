//
//  FooterView.swift
//  Honey Moon
//
//  Created by TheGIZzz on 12/3/2566 BE.
//

import SwiftUI

struct FooterView: View {
    @Binding var showBookingAlert: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button(action: {
                playSound(sound: "sound-click", type: "mp3")
                self.showBookingAlert.toggle()
                print("Success!!!!!!")
            }) {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .accentColor(Color.pink)
                    .background(
                        Capsule().stroke(Color.pink, lineWidth: 2)
                    )
            }
            .accentColor(Color.primary)
            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
            
            
        }
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(showBookingAlert: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
