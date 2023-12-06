//
//  User.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import Foundation

struct User : Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
