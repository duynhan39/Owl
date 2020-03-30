//
//  Space.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import Foundation
import SwiftUI

class WorkSpace: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var appIDCounter: Int
    
    var apps: [App]
    
    static func == (lhs: WorkSpace, rhs: WorkSpace) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
    
    func getNewAppID() -> Int {
        appIDCounter += 1
        return appIDCounter
    }
}
