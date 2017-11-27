//
//  Currency.swift
//  2017_11_27 Getting data from Internet Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
struct Currencies: Codable {
    var base: String
    var date: String
    var rates: [String: Double]
    func getCurrencies()-> [Currency] {
        var outputCurrencies = [Currency]()
        for (key,value) in rates{
            outputCurrencies.append(Currency(Symbol: key, ConversionRate: value, base: base))
        }
        return outputCurrencies
    }
}

class Currency {
    var Symbol: String
    var base: String
    var CobversionRate: Double
    init(Symbol: String, ConversionRate: Double, base: String) {
        self.Symbol = Symbol
        self.CobversionRate = ConversionRate
        self.base = base
    }
}
