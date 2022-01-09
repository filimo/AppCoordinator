//
//  AppCoordinator.swift
//  CoordinatorApp
//
//  Created by Viktor Kushnerov on 3.01.22.
//

import SwiftUI

enum Screen: Equatable {
    case homeView
    case numberListView
    case numberDetailView(Int)
    case custom(String)
}

extension Screen {
    static let homeView1 = custom("\(HomeView.self)")
}

struct AppCoordinator: View {
    @State var stack: [Screen] = [.homeView]

    var body: some View {
        NavigationView {
            NStack(stack: $stack) { screen in
                switch screen {
                case .homeView, .homeView1:
                    HomeView(pickNumberTapped: showNumbers)
                case .numberListView:
                    NumberListView(numberSelected: showNumber, cancel: pop, popToRoot: popToRoot)
                case .numberDetailView(let number):
                    NumberDetailView(number: number, cancel: pop, popToRoot: popToRoot)
                case .custom:
                    EmptyView()
                }
            }
        }
    }

    private func showNumbers() {
        stack.append(.numberListView)
    }

    private func showNumber(_ number: Int) {
        stack.append(.numberDetailView(number))
    }

    private func pop() {
        stack = stack.dropLast()
    }

    private func popToRoot() {
        stack = Array(stack.prefix(1))
    }
}

