//
//  NetworkParameters.swift
//  Marvel Heroes
//
//  Created by Carlos Henrique Gava on 29/12/20.
//

import Foundation
import Alamofire

class NetworkParameters {

    private var params = Parameters()
    private let def: Parameters = [
        "limit": 0,
    ]
    
    init() {
        self.params = self.def
    }
    
    func hash(ts: String, privateKey: String, publicKey: String) -> NetworkParameters {
        self.params["hash"] = Utils.hash(ts: ts, privateKey: privateKey, publicKey: publicKey)
        return self
    }
    
    func apikey(_ apikey: String) -> NetworkParameters {
        self.params["apikey"] = apikey
        return self
    }
    
    func timestamp(_ timestamp: String) -> NetworkParameters {
        self.params["ts"] = timestamp
        return self
    }
    
    func name(_ name: String) -> NetworkParameters {
        self.params["nameStartsWith"] = name
        return self
    }
    
    func offset(_ offset: Int) -> NetworkParameters {
        self.params["offset"] = offset
        return self
    }
    
    func limit(_ limit: Int) -> NetworkParameters {
        self.params["limit"] = limit
        return self
    }
    
    func orderBy(_ orderBy: String) -> NetworkParameters {
        self.params["orderBy"] = orderBy
        return self
    }
    
    func build() -> Parameters {
        return self.params
    }
}
