//
//  MovieController.swift
//  OMDB35
//
//  Created by Colton Swapp on 8/5/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation

class MovieController {
    
    static let apiKey = "afdfc964"
    
    static func fetchMovie(for searchTerm: String, completion: @escaping ( Result<Movie, MovieError>) -> Void) {
        
        guard let baseURL = URL(string: "https://www.omdbapi.com/") else { return completion(.failure(.invalidURL))}
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchQueryItem = URLQueryItem(name: "t", value: searchTerm)
        let apiKeyQueryItem = URLQueryItem(name: "apikey", value: apiKey)
        components?.queryItems = [searchQueryItem, apiKeyQueryItem]
        guard let finalURL = components?.url else { return completion(.failure(.invalidURL))}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData))}
            
            do {
                let topLevelObject = try JSONDecoder().decode(Movie.self, from: data)
                return completion(.success(topLevelObject))
                
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
        
    }
    
}
