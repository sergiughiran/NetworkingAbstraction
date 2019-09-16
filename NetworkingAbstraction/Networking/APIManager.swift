//
//  APIManager.swift
//  NetworkingAbstraction
//
//  Created by Ghiran Sergiu-Robert on 22/07/2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation

final class APIManager {
    
    // MARK: - Public Properties
    
    static let shared = APIManager()
    
    // MARK: - Private Properties
    
    private lazy var urlSession = URLSession.shared
    
    // MARK: - Lifecycle
    
    private init() {}
    
    // MARK: - Logic
    
    func executeRequest<T: Codable>(at endpoint: Endpoint, completion handler: @escaping (Result<T>) -> Void) {
        guard let url = endpoint.url else {
            handler(.failure(.invalidURL))
            return
        }
        
        urlSession.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                handler(.failure(.requestFailure))
                return
            }
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    handler(.success(decodedData))
                } catch {
                    handler(.failure(.decodingFailure))
                }
            } else {
                handler(.success(nil))
            }
        }
    }
    
    func executeRequest<T: Codable>(at endpoint: Endpoint, completion handler: @escaping (Result<[T]>) -> Void) {
        guard let url = endpoint.url else {
            handler(.failure(CustomError.invalidURL))
            return
        }

        let task = urlSession.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                handler(.failure(CustomError.requestFailure))
                return
            }

            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([T].self, from: data)
                    handler(.success(decodedData))
                } catch {
                    handler(.failure(CustomError.decodingFailure))
                }
            } else {
                handler(.success(nil))
            }
        }

        task.resume()
    }
}
