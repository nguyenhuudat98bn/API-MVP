//
//  DataExtension.swift
//  AppDemo
//
//  Created by Dat Nguyen on 20/01/2022.
//

import Foundation

extension Data {
    
    func toUTF8() -> String{
        return String(data: self, encoding: .utf8) ?? ""
    }
    
    func decoder<T: Codable>(classType: T.Type, comlication: (Any, String) -> Void) {
        do {
            let decoder = JSONDecoder()
            let results = try decoder.decode(classType, from: self)
            comlication(results, "")
        } catch {
            print(error.localizedDescription)
            comlication("" ,error.localizedDescription)
        }
        
    }
}
