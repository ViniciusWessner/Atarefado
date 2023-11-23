//
//  Extensions.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import Foundation

//funcao que vai encodar os arquivos em JSON para enviar pro banco de dados
extension Encodable {
    
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:] //caso nao conseguir encodar manda vazio
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }catch {
            return [:]
        }
        
    }
}
