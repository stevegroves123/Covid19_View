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
    let cases: Int
    let deaths: Int
    let countriesAndTerritories: String
    let geoId: String
    let countryterritoryCode: String
    let popData2019: String
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
        case popData2019
        case continentExp
     }
}

/*
 https://opendata.ecdc.europa.eu/covid19/casedistribution/json/
 
 {
    "dateRep" : "19/06/2020",
    "day" : "19",
    "month" : "06",
    "year" : "2020",
    "cases" : 658,
    "deaths" : 42,
    "countriesAndTerritories" : "Afghanistan",
    "geoId" : "AF",
    "countryterritoryCode" : "AFG",
    "popData2019" : "38041757",
    "continentExp" : "Asia"
 },
 */
