//
//  UserDefaultsWrapper.swift
//  weatherApp
//
//  Created by Sam Roman on 10/15/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {

    // MARK: - singleton
    
    static let wrapper = UserDefaultsWrapper()

    // MARK: - getters
    
    func getZip() -> String? {
        return UserDefaults.standard.value(forKey: "zipCode") as? String
    }



    
    // MARK: - setters

    func storeZip(zipCode: String) {
        UserDefaults.standard.set(zipCode, forKey: "zipCode")
    }



    
   
}
