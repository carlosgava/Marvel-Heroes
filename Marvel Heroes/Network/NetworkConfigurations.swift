//
//  NetworkConfigurations.swift
//  Marvel Heroes
//
//  Created by Carlos Henrique Gava on 29/12/20.
//

import Foundation
import Alamofire

private enum NetworkConfigurationsKeys: String {
    case url = "URL"
    case publicKey = "Public Key"
    case privateKey = "Private Key"
}

class NetworkConfigurations {
    static let shared = NetworkConfigurations()
    private let defaults = UserDefaults.init(suiteName: "Marvel Heroes")!
    
    var url: String {
        get {
            self.defaults.string(forKey: NetworkConfigurationsKeys.url.rawValue)!
        }
        
        set {
            self.storeUrl(url: newValue)
        }
    }
    
    var publicKey: String {
        get {
            self.defaults.string(forKey: NetworkConfigurationsKeys.publicKey.rawValue)!
        }
        
        set {
            self.storePublicKey(publicKey: newValue)
        }
    }
    
    var privateKey: String {
        get {
            self.defaults.string(forKey: NetworkConfigurationsKeys.privateKey.rawValue)!
        }
        
        set {
            self.storePrivateKey(privateKey: newValue)
        }
    }
    
    private init() {
        if self.defaults.string(forKey: NetworkConfigurationsKeys.privateKey.rawValue) == nil {
            let fileUrl = Bundle.main.url(forResource: "NetworkConfigurationsKeys", withExtension: "plist")!
            let data = try! Data(contentsOf: fileUrl)
            let properties = try! PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String: String]
            self.setProperties(properties: properties)
        }
    }
    
    private func setProperties(properties: Dictionary<String, String>) {
        self.storeUrl(url: properties[NetworkConfigurationsKeys.url.rawValue]!)
        self.storePublicKey(publicKey: properties[NetworkConfigurationsKeys.publicKey.rawValue]!)
        self.storePrivateKey(privateKey: properties[NetworkConfigurationsKeys.privateKey.rawValue]!)
    }
    
    private func storeUrl(url: String) {
        self.defaults.set(url, forKey: NetworkConfigurationsKeys.url.rawValue)
    }
    
    private func storePublicKey(publicKey: String) {
        self.defaults.set(publicKey, forKey: NetworkConfigurationsKeys.publicKey.rawValue)
    }
    
    private func storePrivateKey(privateKey: String) {
        self.defaults.set(privateKey, forKey: NetworkConfigurationsKeys.privateKey.rawValue)
    }
    
    func url(with path: String) -> String {
        return "\(url)\(path)";
    }
    
    func params() -> NetworkParameters {
        let timestamp = String(Date().timeIntervalSince1970 * 1000)
        
        return NetworkParameters()
            .limit(100)
            .hash(ts: timestamp, privateKey: self.privateKey, publicKey: self.publicKey)
            .timestamp(timestamp)
            .apikey(self.publicKey)
    }
}
