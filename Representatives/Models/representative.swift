//
//  representative.swift
//  Representatives
//
//  Created by winston salcedo on 5/16/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

import UIKit

struct TopLevelResult: Codable {
        let results: [Representative]
}
    
    struct Representative: Codable {
        
        let name: String
        let party: String
        let district: String
        let link: String
        let phone: String
        let office: String
        
    }
//for data returned in JSON call API using "&output=json"
//[result] -> {name, party, district, link, phone number}

