//
//  MoviesListModel.swift
//  AppDemo
//
//  Created by Dat Nguyen on 06/01/2022.
//

import Foundation

class MoviesListModel: NSObject, Codable {
    var title: String?
    var id: Int?
    var overview: String?
    var poster_path: String?
    var vote_average: Double?
    var adult: Bool?
    
}
