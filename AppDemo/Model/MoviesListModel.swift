//
//  MoviesListModel.swift
//  AppDemo
//
//  Created by Dat Nguyen on 06/01/2022.
//

import Foundation
typealias DICT = Dictionary<AnyHashable, Any>
class MoviesListModel: NSObject, Decodable {
    var title: String?
    var id: Int?
    var overview: String?
    var poster_path: String?
    var vote_average: Int?
    
    init(dict: DICT) {
        poster_path = dict["poster_path"] as? String ?? ""

    }
}
