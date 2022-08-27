//
//  ContentView.swift
//  SwiftuiCustomNavView
//
//  Created by liqinghua on 2022/8/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(destination:
                                                Text("Destination")
                                                .customNavigationTitle("Second Screen")
                                                .customNavigationSubtitle("Sibtitle should be showing!!")
                ) {
                    Text("Navigate")
                }
            } //: ZSTACK
            .customNavBarItems(title: "New Title!", subtitle: nil, backButtonHidden: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
