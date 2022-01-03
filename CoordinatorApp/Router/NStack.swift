//
//  NStack.swift
//  CoordinatorApp
//
//  Created by Viktor Kushnerov on 3.01.22.
//

import SwiftUI

struct NStack<Screen, ScreenView: View>: View {
    @Binding var stack: [Screen]
    @ViewBuilder var buildView: (Screen) -> ScreenView
    
    var body: some View {
        stack
            .enumerated()
            .reversed()
            .reduce(NavigationNode<Screen, ScreenView>.end) { pushedNode, new in
                let (index, screen) = new
                return NavigationNode<Screen, ScreenView>.view(
                    buildView(screen),
                    pushing: pushedNode,
                    stack: $stack,
                    index: index
                )
            }
    }
}
