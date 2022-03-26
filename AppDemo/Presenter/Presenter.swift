//
//  Presenter.swift
//  AppDemo
//
//  Created by Dat Nguyen on 06/01/2022.
//

import Foundation
import Alamofire

public enum ServerResponse {
    case result(Any)
    case failure(Int, String)
}

protocol InputProtocol {
    func getMovies(page: Int, apiKey: String)
    
}

protocol OutputProtocol: class {
    func updateView(listMovies: [MoviesListModel])
    
}

class Presenter: InputProtocol {
    
    var view: OutputProtocol?
    
    init() {
        
    }
    
    func attachView(_ view: Any) {
        self.view = view as? OutputProtocol
    }
    
//    func getList<T: Codable>(page: Int, apiKey: String, classType: T.Type){
//        var params = Parameters()
//        params.updateValue(page, forKey: Params.page)
//        params.updateValue(apiKey, forKey: Params.api_key)
//        let router = Router()
//        router.parameters = params
//        router.menthod = .get
//        router.urlString = APIDomain.domain + APIPath.apiListMoviesPath
//        AF.request(router).responseData { data in
//            guard let valuesData = data.value else {return}
//            print(String(data: valuesData, encoding: .utf8) ?? "")
//            do {
//                let decoder = JSONDecoder()
//                let result = try decoder.decode(classType, from: valuesData)
//                print(result)
//            } catch {
//                print("errrrrrrrr")
//
//            }
//
//
//        }
//    }
    
    func getMovies(page: Int, apiKey: String) {
        DataService.callApiListMovies(page: page, apiKey: apiKey) { model in
            if let model = model {
                self.view?.updateView(listMovies: model.results ?? [])
            }
        }
        
    }

    
//    func sendRequest<T: Codable>(_ url: String, classType: T.Type, parameters: [String: Any], completion: @escaping ([String: Any]?, Error?) -> Void) {
//        var components = URLComponents(string: url)!
//        let percentEncodedQuery = parameters.map({ "\($0)=\($1)" }).joined(separator: "&")
//        components.percentEncodedQuery = percentEncodedQuery
//
//        let request = URLRequest(url: components.url!)
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard
//                let data = data,                              // is there data
//                let response = response as? HTTPURLResponse,  // is there HTTP response
//                200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
//                error == nil                                  // was there no error
//            else {
//                completion(nil, error)
//                return
//            }
//
//            let decoder = JSONDecoder()
//
//            let utf8Text = String(data: data, encoding: .utf8)
//
//            print(utf8Text)
//            let result = try? decoder.decode(classType, from: data)
//
//            let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
//            completion(responseObject, nil)
//        }
//        task.resume()
//    }
//
    
    
    
}
