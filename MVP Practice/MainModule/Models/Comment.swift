//
//  Person.swift
//  MVP Practice
//
//  Created by Dmitry Samusenko on 18.02.2023.
//

import Foundation

struct Comment: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
