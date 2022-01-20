//
//  Router.swift
//  AppDemo
//
//  Created by Dat Nguyen on 18/01/2022.
//

import Foundation
import Alamofire

class Router: URLRequestConvertible {
    
    var parameters: Parameters?
    var menthod: HTTPMethod?
    var urlString: String?
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest: URLRequest?
        var components = URLComponents(string: urlString!)
        if let params = parameters {
            if (menthod == .get || menthod == .delete) {
                let percentEncodedQuery = params.map({ "\($0)=\($1)" }).joined(separator: "&")
                components?.percentEncodedQuery = percentEncodedQuery
            } else {
                let bodyData = try JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest!.httpBody = bodyData
            }
            
        }
        urlRequest = URLRequest(url: (components?.url)!)
        urlRequest?.httpMethod = menthod?.rawValue
        return urlRequest!
    }
    
    
}
