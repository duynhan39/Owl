//
//  Space.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import Foundation
import SwiftUI

class WorkSpace: ObservableObject, Codable {
    var id: Int = 0
    var title: String = ""
    var description: String = ""
//    var appIDCounter: Int = 0
    
    @Published var apps: [App] = []
    
    // Codable
    enum CodingKeys: CodingKey {
        case id, title, description, appIDCounter, apps
    }
    
    init() {
        id = 0
        title = ""
        description = ""
//        appIDCounter = 0
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
//        self.appIDCounter = try container.decode(Int.self, forKey: .appIDCounter)
        self.apps = try container.decode(Array<App>.self, forKey: .apps)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
//        try container.encode(appIDCounter, forKey: .appIDCounter)
        try container.encode(apps, forKey: .apps)
    }
}

extension WorkSpace {
    func setValue(id: Int = 0, title: String = "", description: String = "", appIDCounter: Int = 0, apps : [App] = []) {
        self.id = id
        self.title = title
        self.description = description
//        self.appIDCounter = appIDCounter
        self.apps = apps
    }
    
    func getNewAppID() -> Int {
        userData.appIDCounter += 1
        return userData.appIDCounter
    }
    
    func addApp(app: App) {
        apps += [app]
        save(option: DataFile.workSpace)
    }
    
    func addApp(with appInfo: AppInfo)  {
        let newApp = App(appName: appInfo.name, id: self.getNewAppID())
        apps += [newApp]
        save(option: DataFile.workSpace)
    }
    
    func removeApp(app: App) {
        apps.removeAll {
            $0 == app
        }
        save(option: DataFile.workSpace)
    }
}


extension WorkSpace: Hashable, Identifiable {
    // Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
    
    // Identifiable
    static func == (lhs: WorkSpace, rhs: WorkSpace) -> Bool {
        return lhs.id == rhs.id
    }
    


    
    
}
