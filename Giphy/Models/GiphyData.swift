//
//  GiphyData.swift
//  Giphy
//
//  Created by Viktar Semianchuk on 8/22/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

import Foundation

struct GiphyData: Codable {
    let dataId: String?
    let title: String?
    let importDatetime: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case dataId = "id"
        case importDatetime = "import_datetime"
    }
}
