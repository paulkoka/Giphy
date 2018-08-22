//
//  GiphyService.swift
//  Giphy
//
//  Created by Viktar Semianchuk on 8/22/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

import Foundation

enum GiphyServiceError: Error {
    case FetchingDataError
}

class GiphyService {
    private let apiKey = "znWbf6XFLaogUUU7wI6fPEOPxkGIO7cH"
    
    func fetchTrendingsFromUrl(_ stringUrl: String, completionBlock: @escaping (_ objects: [GiphyData]?, Error?) -> Swift.Void) {
        let downloadManager = DownloadManager()
        downloadManager.fetchData(fromURL: stringUrl) { (data) in
            guard let _ = data else {
                completionBlock(nil, GiphyServiceError.FetchingDataError)
                return
            }
        }
    }
}
