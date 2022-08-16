//
//  Storage.swift
//  MyFirstSwiftProject
//
//  Created by Mykhailo Kravchenko on 14.08.2022.
//

import Foundation

class Storage {
    static func setItem<T: Encodable>(value: T, key: String) {
        let encoder = JSONEncoder()
        
        if let encodedValue = try? encoder.encode(value) {
            UserDefaults.standard.set(encodedValue, forKey: key)
        }
    }
    
    static func getItems<T: Decodable>(key: String, type: T.Type) -> T? {
        let foundItems = UserDefaults.standard.value(forKey: key)
        
        if foundItems == nil {
            return nil
        }
        
        let decoder = JSONDecoder()
        
        let decodedItems = try? decoder.decode(type, from: foundItems as! Data)
        
        return decodedItems
    }
    
    static func clearItems(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
