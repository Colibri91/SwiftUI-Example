//
//  ContentView.swift
//  FilmGameDB
//
//  Created by Rıfat mert Dolar on 3.01.2020.
//  Copyright © 2020 Rıfat mert Dolar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let results = ["Ferdi","Burak","Mert","Hasan","Cenk"]
    
    var body: some View {
        VStack{
            NavigationView{
                List(self.results, id: \.self) {nameOfItem in
                             if(nameOfItem == "Ferdi" || nameOfItem == "Mert") {
                                NavigationLink(destination: MovieDetail(name : nameOfItem)) {
                                 ItemWitcher(name : nameOfItem)
                                }
                             }
                             else{
                                NavigationLink(destination: MovieDetail(name :nameOfItem)) {
                                 ItemKatana(name : nameOfItem)
                                }
                             }
                           }
            }
         
                  
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                 Text("Refresh")
                   .fontWeight(.bold)
                   .font(.system(size: 20))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
