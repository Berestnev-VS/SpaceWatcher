//
//  Rockets.swift
//  SpaceXContur
//
//  Created by Владимир on 17.05.2023.
//

import Foundation

struct RocketResponse: Decodable {
    let results: [Rocket]
}

struct Rocket: Codable {
    let height, diameter, mass: Dimension
    let firstStage: Stage
    let secondStage: Stage
    let engines: Engines
    let landingLegs: LandingLegs
    let payloadWeights: [PayloadWeight]?
    let flickrImages: [String]?
    let name, type: String?
    let active: Bool
    let stages, boosters: Int
    let costPerLaunch: Int
    let successRatePct: Int
    let firstFlight, country, company: String?
    let wikipedia: String?
    let description, id: String?
}

struct Dimension: Codable {
    let meters, feet: Double?
}

struct Stage: Codable {
    let thrustSeaLevel, thrustVacuum: Thrust?
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double?
    let burnTimeSec: Int?
    let payloads: Payloads?
    let thrust: Thrust?
}

struct Payloads: Codable {
    let compositeFairing: CompositeFairing?
    let option1: String?
}

struct CompositeFairing: Codable {
    let height, diameter: Dimension?
}

struct Thrust: Codable {
    let kN, lbf: Int?
}

struct Engines: Codable {
    let isp: ISP
    let thrustSeaLevel, thrustVacuum: Thrust?
    let number: Int
    let type, version, layout: String?
    let engineLossMax: Int?
    let propellant1, propellant2: String?
    let thrustToWeight: Double?
}

struct ISP: Codable {
    let seaLevel, vacuum: Int?
}

struct LandingLegs: Codable {
    let number: Int
    let material: String?
}

struct PayloadWeight: Codable {
    let id, name: String?
    let kg, lb: Int?
}
