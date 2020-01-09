//
//  ItemWitcher.swift
//  FilmGameDB
//
//  Created by Rıfat mert Dolar on 3.01.2020.
//  Copyright © 2020 Rıfat mert Dolar. All rights reserved.
//

import SwiftUI

struct ItemWitcher: View {
    
    private var name = "The Witcher : Wild Hunt"
    
    init(name : String = "") {
        self.name = name
    }
    
    var body: some View {
        HStack{
            Image("ic_witcher").resizable().frame(width: 100
                , height: 100, alignment: .center).clipShape(Rectangle()).overlay(
                Rectangle().stroke(Color.gray, lineWidth: 4)).shadow(radius: 10).padding()
            VStack{
                Text(name)
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                Text("Game of The Year")
                
            }
            Spacer()
            if(name.contains("m")){
                Image("ic_star_active")
                    .resizable()
                    .frame(width: 30
                , height: 30, alignment: .center)
                    .padding()
            }
            else{
                Image("ic_star_passive")
                    .resizable()
                    .frame(width: 30
                , height: 30, alignment: .center)
                    .padding()
            }
        }
       
    }
}

struct ItemWitcher_Previews: PreviewProvider {
    static var previews: some View {
        ItemWitcher()
    }
}
