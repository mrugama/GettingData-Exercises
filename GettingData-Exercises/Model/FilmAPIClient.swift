//
//  FilmAPIClient.swift
//  GettingData-Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

class FilmAPIClient {
    private init() {}
    static let manager = FilmAPIClient()
    func getFilm(from urlStr: String, completionHandler: @escaping ([Film]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let filmArr = try JSONDecoder().decode([Film].self, from: data)
                completionHandler(filmArr)
            } catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
