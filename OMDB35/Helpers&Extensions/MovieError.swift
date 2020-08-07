//
//  MovieError.swift
//  OMDB35
//
//  Created by Colton Swapp on 8/5/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation

enum MovieError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The url requested was invalid!"
        case .thrownError(let error):
            return "There was an error: \(error.localizedDescription)"
        case .noData:
            return "Data retreival failed."
        case .unableToDecode:
            return "The data was unable to be decoded."
        }
    }
}
