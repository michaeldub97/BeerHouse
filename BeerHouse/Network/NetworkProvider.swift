//
//  NetworkProvider.swift
//  BeerHouse
//
//  Created by Михаил on 08.07.2022.
//

import Foundation

protocol NetworkProviderProtocol {
    func fetchBeers(result: @escaping (Result<[Beer], Error>) -> Void)
}

struct NetworkProvider: NetworkProviderProtocol {
    
    private let urlString = "https://api.punkapi.com/v2/beers?page=2&per_page=80"
    
    func fetchBeers(result: @escaping (Result<[Beer], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "fetchCurrentBeers", code: -1, userInfo: [:])
            result(.failure(error))
            return
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    print(data)
                    let decoder = JSONDecoder()
                    let beers = try decoder.decode([Beer].self, from: data)
                    result(.success(beers))
                } catch let error as NSError {
                    result(.failure(error))
                }
            } else {
                let error = error ?? NSError(domain: "fetchCurrentBeers", code: -1, userInfo: [:])
                result(.failure(error))
            }
        }
        task.resume()
    }
}
