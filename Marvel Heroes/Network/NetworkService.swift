//
//  NetworkService.swift
//  Marvel Heroes
//
//  Created by Carlos Henrique Gava on 29/12/20.
//

import Foundation
import Alamofire


class NetworkService {
    var config: NetworkConfigurations!
    
    init(config: NetworkConfigurations) {
        self.config = config
    }
    
    func heroes(offset: Int, name: String? = nil, completionHandler: @escaping (AFDataResponse<Response>) -> Void) {
        var params = config.params().offset(offset)
        
        if let name = name {
            if !name.isEmpty {
                params = params.name(name)
            }
        }
        
        AF.request(config.url(with: "characters"), parameters: params.build(), encoding: URLEncoding.queryString)
            .responseDecodable(of: Response.self, completionHandler: completionHandler)
    }
}
