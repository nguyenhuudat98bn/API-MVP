//
//  BaseModel.swift
//  AppDemo
//
//  Created by Dat Nguyen on 07/01/2022.
//

import Foundation


class ResponseModel<T: Codable>: NSObject, Codable {
    var results: T?
}
