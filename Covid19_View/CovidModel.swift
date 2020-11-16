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
    let countriesAndTerritories: String?
    let geoId: String?
    let countryterritoryCode: String?
    let popData2019: Int?
    let continentExp: String?
    let CNF14_dayscases_per_100000: String?

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
        case CNF14_dayscases_per_100000 = "Cumulative_number_for_14_days_of_COVID-19_cases_per_100000"
     }
}

/*
 https://opendata.ecdc.europa.eu/covid19/casedistribution/json/
 {
    "dateRep" : "15/11/2020",
    "day" : "15",
    "month" : "11",
    "year" : "2020",
    "cases" : 205,
    "deaths" : 12,
    "countriesAndTerritories" : "Afghanistan",
    "geoId" : "AF",
    "countryterritoryCode" : "AFG",
    "popData2019" : 38041757,
    "continentExp" : "Asia",
    "Cumulative_number_for_14_days_of_COVID-19_cases_per_100000" : "4.57129254"
 }
 */
