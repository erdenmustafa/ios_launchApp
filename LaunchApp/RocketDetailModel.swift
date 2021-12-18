//
//  RocketDetailModel.swift
//  LaunchApp
//
//  Created by Mustafa Erden on 22.11.2021.
//

import Foundation

struct RocketDetailModel: Codable {
    var id: Int?
    var first_flight: String?
    var stages: Int?
    var company: String?
    var description: String?
    var rocket_name: String?
    var flickr_images: [String]?

    }
