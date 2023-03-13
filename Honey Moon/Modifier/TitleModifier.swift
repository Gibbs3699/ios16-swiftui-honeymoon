//
//  TitleModifier.swift
//  Honey Moon
//
//  Created by TheGIZzz on 13/3/2566 BE.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}

