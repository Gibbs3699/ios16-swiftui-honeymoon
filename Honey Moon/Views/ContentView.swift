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
    @State var showInfoView: Bool = false
    
    var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }
    
    var body: some View {
        VStack {
            
            HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
            
            Spacer()
            
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                }
            }
            .padding(.horizontal)
            
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
