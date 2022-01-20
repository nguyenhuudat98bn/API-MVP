//
//  Constants.swift
//  AppDemo
//
//  Created by Dat Nguyen on 20/01/2022.
//

import Foundation

typealias ResponseSeverHandle = (ResponseSever) -> Void

enum ResponseSever {
    case Result(Any)
    case Error(String)
}
