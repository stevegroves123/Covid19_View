//
//  ContentView.swift
//  Covid19_View
//
//  Created by steve groves on 06/06/2020.
//  Copyright © 2020 steve groves. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let countries = ["Select Country", "Australia", "Belgium", "Brazil", "Canada", "United_Kingdom", "United_States_of_America", "New_Zealand"]
    @State var selectedCountry: Int = 0
    @State var records = [Record]()
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selectedCountry, label: Text("Country:").font(.headline)) {
                    ForEach(0..<countries.count) {
                        Text(self.countries[$0].replacingOccurrences(of: "_", with: " "))
                            .font(.headline)
                    }
                }
            List (records.filter({covid in covid.countriesAndTerritories == self.countries[self.selectedCountry]}), id: \.id) {covid in
                Text("\(covid.day)/\(covid.month)")
                Text("Cases:\(covid.cases ?? "0")")
                if Int(covid.deaths)! > 1000 {
                    Text("Deaths:\(covid.deaths )").foregroundColor(.red)
                } else if Int(covid.deaths)! >= 500 && Int(covid.deaths)! < 1000 {
                    Text("Deaths:\(covid.deaths )").foregroundColor(.orange)
                } else if Int(covid.deaths)! >= 0 && Int(covid.deaths)! < 201 {
                    Text("Deaths:\(covid.deaths )").foregroundColor(.green)
                } else {
                    Text("Deaths:\(covid.deaths)")
                    }
                Text("Sum:\(Int(covid.cases ?? "0")! + Int(covid.deaths)!)")
                }
            }.navigationBarTitle("Covid19: \(self.countries[self.selectedCountry].replacingOccurrences(of: "_", with: " "))")
                .font(.system(size: 16))
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
                        self.records = decodedResponse.records
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
