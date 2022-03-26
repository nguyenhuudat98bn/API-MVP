//
//  ServiceToken.swift
//  AppDemo
//
//  Created by Đạt Nguyễn hữu on 26/03/2022.
//

import Foundation

class  ServiceToken: NSObject {
    static let shared = ServiceToken()
    
    lazy var responseHandles = [(Bool) -> Void]()
    
    func requestToken(completion: @escaping (Bool) -> Void) {
        responseHandles.append(completion)
        if responseHandles.count == 1 {
            
            // Call Api request token success =>
            responseHandles.forEach { (handle) in
                handle(true)
            }
        }
    }
}
