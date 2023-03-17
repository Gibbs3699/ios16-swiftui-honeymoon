//
//  CardTransition.swift
//  Honey Moon
//
//  Created by TheGIZzz on 17/3/2566 BE.
//

import SwiftUI

extension AnyTransition {
    static var traillingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}

