//
//  APICaller.swift
//  Netflix-Clone
//
//  Created by Orçun Erdil on 1.07.2023.
//

import Foundation

struct Constant {
    static let API_KEY = "697d439ac993538da4e3e60b54e762cd"
    static let BASE_URL = "https://api.themoviedb.org"
}

enum APIError : Error{
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie],Error>) -> Void) {
        
        guard let url = URL(string: "\(Constant.BASE_URL)/3/trending/all/day?api_key=\(Constant.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data,response,error) in
            
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(GetData.self, from: data)
                completion(.success(results.results))
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
   
    
}
