//
//  MovieItem.swift
//  FilmGameDB
//
//  Created by Rıfat mert Dolar on 8.01.2020.
//  Copyright © 2020 Rıfat mert Dolar. All rights reserved.
//

import SwiftUI
import URLImage

struct MovieItem: View {
    
    private var url = ""
    private var title = ""
    
    init(url : String = "",title : String = "") {
        self.url = url
        self.title = title
    }
    
    var body: some View {
        VStack{
            URLImage(URL(string: url)!){
                proxy in
                proxy.image
                    .resizable()                     // Make image resizable
                    .aspectRatio(contentMode: .fill) // Fill the frame
                    .clipped()                       // Clip overlaping parts
            }
            Text(title)
        }
    }
}

struct MovieItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieItem()
    }
}
