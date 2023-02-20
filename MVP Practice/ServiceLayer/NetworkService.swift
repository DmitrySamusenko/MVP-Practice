//
//  NetworkService.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 20.02.2023.
//

import Foundation
protocol NetworkServiceProtocol {
    func getComment(completion: @escaping(Result<[Comment]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getComment(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                guard let objectData = data else { return }
                let object = try JSONDecoder().decode([Comment].self, from: objectData)
                completion(.success(object))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
