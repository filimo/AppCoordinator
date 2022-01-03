//
//  NavigationNode.swift
//  CoordinatorApp
//
//  Created by Viktor Kushnerov on 3.01.22.
//

import SwiftUI

indirect enum NavigationNode<Screen, ScreenView: View>: View {
    case view(ScreenView, pushing: NavigationNode<Screen, ScreenView>, stack: Binding<[Screen]>, index: Int)
    case end
    
    var body: some View {
        if case .view(let view, let pushedNode, let stack, let index) = self {
            view.background(
                NavigationLink(
                    destination: pushedNode,
                    isActive: Binding(
                        get: {
                            if case .end = pushedNode {
                                return false
                            }
                            return stack.wrappedValue.count > index + 1
                        },
                        set: { isPushed in
                            guard !isPushed else { return }
                            stack.wrappedValue = Array(stack.wrappedValue.prefix(index + 1))
                        }),
                    label: EmptyView.init
                ).hidden()
            )
        } else {
            EmptyView()
        }
    }
}
