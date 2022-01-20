//
//  DataService.swift
//  AppDemo
//
//  Created by Dat Nguyen on 20/01/2022.
//

import Foundation
import Alamofire

class DataService: NSObject {
    static func request<T: Codable>(router: Router, classType: T.Type, completion: @escaping(ResponseSever) -> Void) {
        AF.request(router).responseData { response in
            DEBUGLogResponse(menthod: router.menthod?.rawValue, response: response.value?.toUTF8(), url: router.urlString)
            guard let data = response.value
            else {completion(.Error(response.error.debugDescription))
                return}
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(classType, from: data)
                completion(.Result(results))
            } catch {
                print("API:DecoderErr\(error.localizedDescription)")
                completion(.Error(error.localizedDescription))
            }
        }
    }
}

extension DataService {
    //example
    static func callApiListMovies(page: Int, apiKey: String, completion: @escaping(ResponseModel<[MoviesListModel]>?) -> Void) {
        let router = Router()
        var params = Parameters()
        params.updateValue(page, forKey: Params.page)
        params.updateValue(apiKey, forKey: Params.api_key)
        router.parameters = params
        router.menthod = .get
        router.urlString = APIDomain.domain + APIPath.apiListMoviesPath
        request(router: router, classType: ResponseModel<[MoviesListModel]>.self) { response in
            switch response {
            case .Result(let data):
                if let model = data as? ResponseModel<[MoviesListModel]> {
                    completion(model)
                    break
                }
            case .Error( _):
                completion(nil)
            }
        }
    }
}
