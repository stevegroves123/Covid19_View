//
//  ContentView.swift
//  Covid19_View
//
//  Created by steve groves on 06/06/2020.
//  Copyright © 2020 steve groves. All rights reserved.
//

import SwiftUI

struct CovidData: Codable, Identifiable {
    let id = UUID()
    let records: [Record]
}

struct Record: Codable {
    let dateRep: String
    let day: String
    let month: String
    let year: String
    let cases: String
    let deaths: String
    var countriesAndTerritories: String
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

struct ContentView: View {
    @State var records = [Record]()
    
    var body: some View {
        NavigationView {
            List (records, id: \.cases) {covid in
                Text("\(covid.countriesAndTerritories) \(covid.dateRep) Cases:\(covid.cases) Deaths:\(covid.deaths)")
                }
            }
        .onAppear(perform: loadData)
    }
    

    func loadData() {
        guard let url = URL(string: "https://opendata.ecdc.europa.eu/covid19/casedistribution/json/") else {
                print("Invaid URL")
                return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(CovidData.self, from: data) {
                    DispatchQueue.main.async {
                        self.records = decodedResponse.records.filter({covid in covid.countriesAndTerritories == "United_Kingdom"})
                    }
                    return
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
