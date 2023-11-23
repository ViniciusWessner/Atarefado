//
//  User.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
