//
//  ApiFactory.swift
//  FilmGameDB
//
//  Created by Rıfat mert Dolar on 7.01.2020.
//  Copyright © 2020 Rıfat mert Dolar. All rights reserved.
//

import Foundation

protocol ApiFactory {
    func searchContent(searchKey : String,completion : @escaping(Welcome?,ApiError?) ->Void)
}
