//
//  File.swift
//  Posts and Comments
//
//  Created by kalyan on 3/14/26.
//

import Foundation


struct Post: Codable, Hashable,Identifiable{
    var  id: Int
    var userId: Int
    var title: String
    var body: String
}


struct Comments: Codable,Hashable,Identifiable{
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
