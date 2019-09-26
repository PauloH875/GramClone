//
//  PostModel.swift
//  CIA
//
//  Created by Paul Hulatt on 26/09/2019.
//  Copyright © 2019 Apptimal Ltd. All rights reserved.
//

import Foundation

struct myPost: Codable {
    
    let username: String?
    let title: String?
    let likes: Int?
    let imageUrl: URL?
    
    private enum CodingKeys: String, CodingKey {
        case username
        case title
        case likes
        case imageUrl = "image_url"
    }
}
