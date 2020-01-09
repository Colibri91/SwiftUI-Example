//
//  SearchResult.swift
//  FilmGameDB
//
//  Created by Rıfat mert Dolar on 7.01.2020.
//  Copyright © 2020 Rıfat mert Dolar. All rights reserved.
//
//

// MARK: - Welcome
import Foundation

struct Welcome: Codable {
    let search: [Search]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct Search: Codable {
    let title, year, imdbID: String
    let type: TypeEnum
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case game = "game"
    case movie = "movie"
}
