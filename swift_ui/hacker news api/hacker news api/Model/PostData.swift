//
//  PostData.swift
//  hacker news api
//
//  Created by Mac on 2/23/23.
//

import Foundation

struct Result: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    let objectID: String
    let title: String
    let points: Int
    let url: String?
    var id: String{
        objectID
    }
}
