//
//  App.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import Foundation
import SwiftUI

class AppInfo: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var officialName: String
    var url: String
    
    static func == (lhs: AppInfo, rhs: AppInfo) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
    
    init() {
        id = 0
        name = ""
        officialName = ""
        url = ""
    }
}

extension AppInfo {
    var image: Image {
        ImageStore.shared.image(name: name)
    }
}

