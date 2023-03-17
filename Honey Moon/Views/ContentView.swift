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
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65
    @State private var lastCardIndex: Int = 1
    
    // add @State to change value dynamically
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    private func moveCards() {
        cardViews.removeFirst()
        
        self.lastCardIndex += 1
    
        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]

        let newCardView = CardView(honeymoon: honeymoon)
        
        cardViews.append(newCardView)
        
    }
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    var body: some View {
        VStack {
            
            HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: 0)
            
            Spacer()
            
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "xmark.circle")
                                    .font(.system(size: 100, weight: .regular))
                                .foregroundColor(.white)
                                .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                Image(systemName: "heart.circle")
                                    .font(.system(size: 100, weight: .regular))
                                    .foregroundColor(.white)
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        )
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0 )
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: 0)
                }
                .gesture(LongPressGesture(minimumDuration: 0.01)
                .sequenced(before: DragGesture())
                .updating(self.$dragState, body: { (value, state, transaction) in
                        switch value {
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                        default:
                            break
                        }
                    })
                    .onEnded({ (value) in
                        guard case .second(true, let drag?) = value else {
                            return
                        }
                        
                        if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                            self.moveCards()
                        }
                    })
                )
            }
            .padding(.horizontal)
            
            Spacer()
            
            FooterView(showBookingAlert: $showBookingAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: 0)
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
