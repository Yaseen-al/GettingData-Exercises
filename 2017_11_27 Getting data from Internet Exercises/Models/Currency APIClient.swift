//
//  Currency APIClient.swift
//  2017_11_27 Getting data from Internet Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
struct CurrencyAPIClient {
    private init() {}
    static let manager = CurrencyAPIClient()
    func getFilms(from urlStr: String, completionHandler: @escaping ([Currency]) -> Void, errorHandler: (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let rates = try JSONDecoder().decode(Currencies.self, from: data)
                completionHandler(rates.getCurrencies())
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
