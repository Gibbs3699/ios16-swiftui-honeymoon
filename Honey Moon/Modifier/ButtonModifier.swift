//
//  ButtonModifier.swift
//  Honey Moon
//
//  Created by TheGIZzz on 14/3/2566 BE.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Capsule().fill(.pink)
            )
            .foregroundColor(.white)
    }
}

