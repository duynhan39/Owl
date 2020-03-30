//
//  UserData.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
//    @Published var showFavoritesOnly = false
    @Published var allSpaces = workSpacesInfo
    @Published var allApps = appsInfo
    
//    @Published var profile = Profile.default
}
