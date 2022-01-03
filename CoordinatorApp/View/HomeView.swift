//
//  HomeView.swift
//  CoordinatorApp
//
//  Created by Viktor Kushnerov on 3.01.22.
//

import SwiftUI

struct HomeView: View {
    let pickNumberTapped: () -> Void
    
    var body: some View {
        Button(action: pickNumberTapped) {
            Text("Pick Number")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(pickNumberTapped: {})
    }
}
