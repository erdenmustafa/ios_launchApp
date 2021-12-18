// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let launchModel = try? newJSONDecoder().decode(LaunchModel.self, from: jsonData)

import Foundation

// MARK: - LaunchModel
struct LaunchModel: Codable {
    var flight_number: Int?
    var mission_name: String?
    var mission_id: [String]?
    var launch_year: String?
    var launch_date_utc: String?
    var launch_success: Bool?
    var rocket: RocketModel?
    var launch_site: LaunchSite?
    var launchFailureDetails: LaunchFailureDetails?
    var details: String?
   


    
}

// MARK: - LaunchFailureDetails
struct LaunchFailureDetails: Codable {
    var time: Int?
    var reason: String?
}

// MARK: - LaunchSite
struct LaunchSite: Codable {
    var site_id, site_name, site_name_long: String?


}
