//
//  SettingsView.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 04/10/21.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedCountry = "us"
    
    
    init() {
        let previousSelectedCanteen = try? UserDefaults.standard.getObject(objectType: DefaultCountry.self, forKey: UserDefaultKeys.countryName.rawValue)?.countryName ?? ""
      
        if let value = previousSelectedCanteen {
            _selectedCountry = State<String>(initialValue: value)
        }
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Country", selection: $selectedCountry) {
                    ForEach(NewsCountry.arrayStr, id: \.self) {
                        Text($0)
                    }
                }

                .onReceive([self.selectedCountry].publisher.first()) { (value) in
                    let countryCode = NewsCountry(rawValue : selectedCountry)?.countryCode ?? "us"
                    let obj = DefaultCountry(countryName : selectedCountry , countryCode : countryCode)
                    
                   try? UserDefaults.standard.setObject(object: obj, forKey: UserDefaultKeys.countryName.rawValue)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
