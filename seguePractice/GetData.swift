//
//  GetData.swift
//  seguePractice
//
//  Created by Marty Avedon on 12/7/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

func getDataFrom(url: URL, callback: @escaping (_ data: Data?, _ response: URLResponse?,  _ error: Error?) -> Void) {
    URLSession.shared.dataTask(with: url) {
        (data, response, error) in
            callback(data, response, error)
    }.resume()
}

