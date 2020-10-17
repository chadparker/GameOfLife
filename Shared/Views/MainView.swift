//
//  MainView.swift
//  Shared
//
//  Created by Chad Parker on 10/13/20.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image("header")
                .padding(.vertical, 50)
            GridView()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
