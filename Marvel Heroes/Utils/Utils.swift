//
//  Utils.swift
//  Marvel Heroes
//
//  Created by Carlos Henrique Gava on 29/12/20.
//

import Foundation

class Utils {
    static func cryptoMD5(ts: String, privateKey: String, publicKey: String) -> String {
        return "\(ts)\(privateKey)\(publicKey)".md5()
    }
}
