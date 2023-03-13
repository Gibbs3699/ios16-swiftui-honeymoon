//
//  ContentView.swift
//  Honey Moon
//
//  Created by TheGIZzz on 7/3/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @State var showBookingAlert: Bool = false
    @State var showGuideView: Bool = false
    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuideView)
            
            Spacer()
            
            CardView(honeymoon: honeymoonData[1])
            
            Spacer()
            
            FooterView(showBookingAlert: $showBookingAlert)
        }
        .padding()
        .alert(isPresented: $showBookingAlert) {
            Alert(
                title: Text("Success"),
                message: Text("Wishing a lovely and most precious of the times together for the amazing couple"),
                dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
