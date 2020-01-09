//
//  HomeUI.swift
//  FilmGameDB
//
//  Created by Rıfat mert Dolar on 8.01.2020.
//  Copyright © 2020 Rıfat mert Dolar. All rights reserved.
//

import SwiftUI

struct HomeUI: View {
    
    @ObservedObject private var vm = HomeViewModel()
    @State private var word : String = ""
    
    var body: some View {
        VStack{
            HStack{
                
                TextField(" Enter the content name", text: $word).font(.subheadline)
                    .foregroundColor(.purple)
                    .padding(10)
                    .overlay(
                        Capsule(style: .continuous)
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 2))
                ).padding(10)
                
                Button(action: {
                    self.vm.searchData(key: self.word.replacingOccurrences(of: " ", with: "%20"))
                }) {
                    Text("Search").padding(10)
                }
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 2))
                ).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
            }
            List {
                ForEach(0..<vm.searchList.count) { index in
                    HStack {
                        ForEach(0..<self.vm.searchList[index].count) { (i : Int) in
                            MovieItem(url: self.vm.searchList[index][i].poster, title: self.vm.searchList[index][i].title)
                        }
                    }
                    
                }
            }.edgesIgnoringSafeArea([.leading, .trailing])
                .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
        }
    }
}

struct HomeUI_Previews: PreviewProvider {
    static var previews: some View {
        HomeUI()
    }
}
