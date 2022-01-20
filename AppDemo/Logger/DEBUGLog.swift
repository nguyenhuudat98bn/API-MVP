//
//  DEBUGLog.swift
//  AppDemo
//
//  Created by Dat Nguyen on 20/01/2022.
//

import Foundation

func DEBUGLogResponse(menthod: String?, response: String?, url: String?){
    print("APILOG\n:URL:\(url ?? "")\n MENTHOD:\(menthod ?? "")\n RESPONSE:\(response ?? "")")
}
