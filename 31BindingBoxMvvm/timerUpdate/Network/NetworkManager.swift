//
//  NetworkManager.swift
//  timerUpdate
//
//  Created by Luat on 2/2/22.
//

import Foundation

struct NetworkManager {
    func cycleCodeOnRepeat(completion: @escaping (AccessCodeModel) -> Void) {
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
            let accessCodeModel = Server.generateAccessCode()
            completion(accessCodeModel)
        }
    }
}

/// Some server function
private class Server {
    static func generateAccessCode() -> AccessCodeModel {
        let alpha = "abcdefghijklmnopqrstuvwxyz"
        var code = ""
        for _ in 0...5 {
            let random = Int.random(in: 0...25)
            let index = alpha.index(alpha.startIndex, offsetBy: random)
            code.append(alpha[index])
        }
        return AccessCodeModel(accessCode: code)
    }
}
