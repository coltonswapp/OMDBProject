//
//  Movie.swift
//  OMDB35
//
//  Created by Colton Swapp on 8/5/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    let Title: String
    let Year: String
    let Rated: String
    let Plot: String
    let BoxOffice: String
    let Ratings: [Rating]
}

struct Rating: Decodable {
    let Source: String
    let Value: String
}
