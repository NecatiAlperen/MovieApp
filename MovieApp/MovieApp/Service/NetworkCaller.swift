//
//  NetworkCaller.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 28.02.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(_ endPoint: Endpoint, completion: @escaping (Result<T,Error>) -> Void)
}



final class NetworkCaller : NetworkServiceProtocol {
    
    
    func fetchData<T: Decodable>(_ endPoint: Endpoint, completion: @escaping (Result<T,Error>) -> Void){
        
        let task = URLSession.shared.dataTask(with: endPoint.request()) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 , response.statusCode <= 299 else {
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
            do {
                let decoderData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoderData))
            } catch let  error {
                print(error)
            }
        }
        task.resume()
    }
}
