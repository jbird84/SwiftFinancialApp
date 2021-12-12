//
//  APIService.swift
//  SwiftFinancialCourse
//
//  Created by Kinney Kare on 12/11/21.
//

import Foundation
import Combine

struct APIService {
    var API_KEY: String {
        return keys.randomElement() ?? ""
    }

    let keys = ["1QZZ3DK8GC2Z18DD", "8OT5R9HD89D6Z0U3", "YUI1WLMXFHBML4DE"]
    
    func fetchSymbolsPublisher(keyWords: String) -> AnyPublisher<SearchResults, Error> {
        
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keyWords)&apikey=\(API_KEY)"
       
        let url = URL(string: urlString)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: SearchResults.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
    
}
