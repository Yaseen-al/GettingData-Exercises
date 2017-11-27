//
//  Films.swift
//  2017_11_27 Getting data from Internet Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
struct Film: Codable {
    let title: String
    let description: String
    let director: String
    let producer: String
    let release_date: String
    let rt_score: String
}
