//
//  NumberListView.swift
//  CoordinatorApp
//
//  Created by Viktor Kushnerov on 3.01.22.
//

import SwiftUI

struct NumberListView: View {
    let numberSelected: (Int) -> Void
    let cancel: () -> Void
    let popToRoot: () -> Void

    var body: some View {
        VStack {
            Button(action: cancel) {
                Text("Go back")
            }
            Button(action: popToRoot) {
                Text("Go back to Root")
            }
            
            List(1 ... 100, id: \.self) { number in
                Button("\(number)") {
                    numberSelected(number)
                }
            }
        }
    }
}

struct NumberListView_Previews: PreviewProvider {
    static var previews: some View {
        NumberListView(numberSelected: { _ in }, cancel: {}, popToRoot: {})
    }
}
