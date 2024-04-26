//
//  NetworkRequestManager.swift
//  PaginationApp
//
//  Created by localuser on 26/04/24.
//

import Foundation

enum NetworkError: Error {
    case URLError
    case dataError
    case parseError
    
    
}

class NetworkRequestManager {
    
    let baseUrl = "http://jsonplaceholder.typicode.com/posts"
    private var currentPAge = 0
    private var itemsperpage = 20

    init() {
        
    }
    
    
    func fetchApiData(completion: @escaping(Result<[Post],Error>) -> Void) {
        
        
        let urlString = "\(baseUrl)?_start=\(currentPAge)&_limit=\(itemsperpage)"
        
        guard let url = URL(string:urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data,response,error in
            
            if error != nil {
                completion(.failure(NetworkError.URLError))
            }
            
            guard let data = data else {
                return completion(.failure(NetworkError.dataError))
            }
            
          
            do {
                let parsedData =  try JSONDecoder().decode([Post].self, from: data)
                completion(.success(parsedData))
                
            } catch {
                return completion(.failure(NetworkError.parseError))
            }
            
        }
        task.resume()
                
    }
    
    func loadPage(completion:@escaping(Result<[Post],Error>) -> Void) {
        currentPAge += 20
        fetchApiData(completion: completion)
    }
}
