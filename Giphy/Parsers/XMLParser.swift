//
//  XMLParser.swift
//  Giphy
//
//  Created by Viktar Semianchuk on 8/22/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

import Foundation

class XMLParser {
    func parse(data: Data) -> GiphyData? {
        var dataObj: GiphyData?
        do {
            let decoder = JSONDecoder()
            dataObj = try decoder.decode(GiphyData.self, from: data)
        } catch let error {
            print("Error: \(error)")
        }
        return dataObj
    }
}
