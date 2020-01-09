//
//  MainUI.swift
//  FilmGameDB
//
//  Created by Rıfat mert Dolar on 7.01.2020.
//  Copyright © 2020 Rıfat mert Dolar. All rights reserved.
//

import SwiftUI

struct MainUI: View {
    
    @State var selectedView = 0
    
    var body: some View {
        TabView(selection: $selectedView) {
            HomeUI()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Home")
                }.tag(0)
            ItemWitcher()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Favorites")
                }.tag(1)
        }
    }
}

struct MainUI_Previews: PreviewProvider {
    static var previews: some View {
        MainUI()
    }
}
