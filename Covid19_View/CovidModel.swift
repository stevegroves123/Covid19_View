//
//  CovidModel.swift
//  Covid19_View
//
//  Created by steve groves on 09/06/2020.
//  Copyright © 2020 steve groves. All rights reserved.
//

import Foundation
import SwiftUI

struct CovidData: Codable, Identifiable {
    let id = UUID()
    let records: [Record]
}

struct Record: Codable, Identifiable {
    let id = UUID()
    let dateRep: String
    let day: String
    let month: String
    let year: String
    let cases: String?
    let deaths: String
    let countriesAndTerritories: String
    let geoId: String
    let countryterritoryCode: String
    let popData2018: String
    let continentExp: String

    enum CodingKeys: String, CodingKey {
        case dateRep
        case day
        case month
        case year
        case cases
        case deaths
        case countriesAndTerritories
        case geoId
        case countryterritoryCode
        case popData2018
        case continentExp
     }
}
