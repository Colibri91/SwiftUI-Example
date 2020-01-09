//
//  HomeViewModel.swift
//  FilmGameDB
//
//  Created by Rıfat mert Dolar on 8.01.2020.
//  Copyright © 2020 Rıfat mert Dolar. All rights reserved.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject {
    
    @Published var searchList : [[Search]] = []
    
    init(){
        searchData(key: "witcher")
    }
    

     func searchData(key : String) {
        let req = ApiRequest()
        req.searchContent(searchKey: key) { [weak self](welcome, error) in
            guard let welcome = welcome else {
                return
            }
            self?.searchList.append(contentsOf: welcome.search.chunked(into: 2))
            print(welcome.search)
        }
    }
}
