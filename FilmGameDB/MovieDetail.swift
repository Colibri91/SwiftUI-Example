//
//  MovieDetail.swift
//  FilmGameDB
//
//  Created by Rıfat mert Dolar on 6.01.2020.
//  Copyright © 2020 Rıfat mert Dolar. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    
    var name : String
    
    var body: some View {
        Text(name)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(name: "")
    }
}
