//
//  Location.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
    
    // Handles the case where postcode might be a String in some responses
    enum CodingKeys: String, CodingKey {
        case street, city, state, country, postcode, coordinates, timezone
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        street = try container.decode(Street.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        country = try container.decode(String.self, forKey: .country)
        coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        timezone = try container.decode(Timezone.self, forKey: .timezone)

        // Decode postcode flexibly, handling both Int and String
        if let postcodeInt = try? container.decode(Int.self, forKey: .postcode) {
            postcode = postcodeInt
        } else if let postcodeString = try? container.decode(String.self, forKey: .postcode),
                  let postcodeInt = Int(postcodeString) {
            postcode = postcodeInt
        } else {
            throw DecodingError.dataCorruptedError(forKey: .postcode, in: container, debugDescription: "Postcode is not a valid Int or String convertible to Int.")
        }
    }
    
    // The Encodable conformance is provided for completeness if you need to encode back to JSON
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(street, forKey: .street)
        try container.encode(city, forKey: .city)
        try container.encode(state, forKey: .state)
        try container.encode(country, forKey: .country)
        try container.encode(postcode, forKey: .postcode)
        try container.encode(coordinates, forKey: .coordinates)
        try container.encode(timezone, forKey: .timezone)
    }
    
    static let example = Location(street: .example, city: "Chicago", state: "IL", country: "USA", postcode: 60616, coordinates: .example, timezone: .example)

}

extension Location {
    init(street: Street, city: String, state: String, country: String, postcode: Int, coordinates: Coordinates, timezone: Timezone) {
        self.street = street
        self.city = city
        self.state = state
        self.country = country
        self.postcode = postcode
        self.coordinates = coordinates
        self.timezone = timezone
    }
}
