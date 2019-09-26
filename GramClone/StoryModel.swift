//
//  StoryModel.swift
//  CIA
//
//  Created by Paul Hulatt on 26/09/2019.
//  Copyright © 2019 Apptimal Ltd. All rights reserved.
//

import Foundation

struct myStory: Codable {
    
    let name: String?
    let imageUrl: URL?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageUrl = "image_url"
    }
}
