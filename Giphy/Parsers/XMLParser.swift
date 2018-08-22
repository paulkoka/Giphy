//
//  XMLParser.swift
//  Giphy
//
//  Created by Viktar Semianchuk on 8/22/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

import Foundation

class XMLParser<T: Decodable> {
    func parse(data: Data) -> T? {
        var dataObj: T?
        do {
            let decoder = JSONDecoder()
            dataObj = try decoder.decode(T.self, from: data)
        } catch let error {
            print("Error: \(error)")
        }
        return dataObj
    }
}
