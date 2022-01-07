//
//  Presenter.swift
//  AppDemo
//
//  Created by Dat Nguyen on 06/01/2022.
//

import Foundation


protocol InputProtocol {
    func getMovies(page: Int, apiKey: String)
    
}

protocol OutputProtocol: class {
    func updateView(listMovies: [MoviesListModel])
    
}

class Presenter: InputProtocol {
    
    weak var view: OutputProtocol?
    
    init() {
        
    }
    
    func attachView(_ view: Any) {
        self.view = view as? OutputProtocol
    }
    
    func getMovies(page: Int, apiKey: String) {
        
        var params = [String: Any]()
        params[Params.page] = page
        params[Params.api_key] = apiKey
        sendRequest(APIDomain.domain + APIPath.apiListMoviesPath, parameters: params) { responseObject, error in
            guard let responseObject = responseObject, error == nil else {
                print(error ?? "Unknown error")
                return
            }
            do {
                var arrModel: [MoviesListModel] = []
                if let reults = responseObject["results"] {
                    let dict = reults as! [DICT]
                    for i in dict {
                        let model = MoviesListModel(dict: i)
                        arrModel.append(model)
                    }
                }
                self.view?.updateView(listMovies: arrModel)
                
            } catch {
                print("Error during ecoding: (error.localizedDescription)")
            }
            
        }
    }
    
    func getUrl(page: Int, apiKey: String){
        
        
        
    }
    

    
    func sendRequest(_ url: String, parameters: [String: Any], completion: @escaping ([String: Any]?, Error?) -> Void) {
        var components = URLComponents(string: url)!
        let percentEncodedQuery = parameters.map({ "\($0)=\($1)" }).joined(separator: "&")
        components.percentEncodedQuery = percentEncodedQuery
        
        let request = URLRequest(url: components.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let data = data,                              // is there data
                let response = response as? HTTPURLResponse,  // is there HTTP response
                200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
                error == nil                                  // was there no error
            else {
                completion(nil, error)
                return
            }
            
            let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
            completion(responseObject, nil)
        }
        task.resume()
    }
    
    
    
    
}
