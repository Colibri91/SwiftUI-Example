//
//  ArrayExt.swift
//  FilmGameDB
//
//  Created by Rıfat mert Dolar on 8.01.2020.
//  Copyright © 2020 Rıfat mert Dolar. All rights reserved.
//

import Foundation

extension Array {
    func chunked(into size:Int) -> [[Element]] {
        
        var chunkedArray = [[Element]]()
        
        for index in 0...self.count {
            if index % size == 0 && index != 0 {
                chunkedArray.append(Array(self[(index - size)..<index]))
            } else if(index == self.count) {
                chunkedArray.append(Array(self[index - 1..<index]))
            }
        }
        
        return chunkedArray
    }
}
