//
//  UserData.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import Combine
import SwiftUI

//final class UserData: ObservableObject {
//    @Published var allSpaces = workSpacesInfo
//    @Published var allApps = appsInfo
//}

class UserData: Codable, Hashable, Identifiable {
    
    var firstName:String = ""
    var lastName:String = ""
    var userID:Int = 0
    var workSpaces:[WorkSpace]? = nil
    var appIDCounter:Int = 0
    var workSpaceIDCounter:Int = 0

    static func == (lhs: UserData, rhs: UserData) -> Bool {
        return lhs.userID == rhs.userID
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(userID)
    }
}
