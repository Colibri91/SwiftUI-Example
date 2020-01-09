//
//  NetworkManager.swift
//  FilmGameDB
//
//  Created by Rıfat mert Dolar on 7.01.2020.
//  Copyright © 2020 Rıfat mert Dolar. All rights reserved.
//

import Foundation

let apiKey = "a6a03c11"

enum HttpMethod: String {
    case get
    case post
    case put
    case patch
    case delete
}

enum ApiError: Error{
    case responseProblem
    case decodingProblem
    case otherProblem
}

class ApiRequest : ApiFactory {
    
    func searchContent(searchKey : String,completion: @escaping (Welcome?,ApiError?) -> Void) {
        let query = "s=\(searchKey)"
        sendRequest(httpMethod: HttpMethod.get.rawValue,endPoint : query,completion: { (result: Result<Welcome, ApiError>) in
            switch result{
            case .success(let welcome):
                completion(welcome,nil)
            case .failure(let error) :
                completion(nil,error)
            }
        })
    }
    
    private func sendRequest<T:Decodable>(httpMethod: String,endPoint : String,completion: @escaping (Result<T, ApiError>) -> Void) {
        
        let resourceString = "http://omdbapi.com/?apikey=\(apiKey)&\(endPoint)"
        guard let resourceUrl = URL(string: resourceString) else {fatalError()}
        
        do{
                  var urlRequest = URLRequest(url : resourceUrl)
                  urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                  
                  let dataTask = URLSession.shared.dataTask(with: urlRequest){ data, response, _ in
                      guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200, let
                          jsonData = data else {
                          completion(.failure(.responseProblem))
                          return
                      }
                      
                      do {
                          let data = try JSONDecoder().decode(T.self, from: jsonData)
                        DispatchQueue.main.async {
                            //print(data)
                            completion(.success(data))
                        }
                      }catch{
                        DispatchQueue.main.async {
                            completion(.failure(.decodingProblem))
                        }
                      }
                  }
                  dataTask.resume()
              }
    }
    
}
