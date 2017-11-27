//
//  film APIClient.swift
//  2017_11_27 Getting data from Internet Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
struct FilmAPIClient {
    private init() {}
    static let manager = FilmAPIClient()
    func getFilms(from urlStr: String, completionHandler: @escaping ([Film]) -> Void, errorHandler: (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let films = try JSONDecoder().decode([Film].self, from: data)
                completionHandler(films)
            }
            catch {
                print(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: {print($0)})
    }
}
