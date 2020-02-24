//
//  AppListing.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct AppListing: View {
    var apps: [App]
    var selectedApp: App?
    
    var body: some View {
        VStack {
//            Text("Hi")
            ForEach(apps) { app in
                AppIconSideBar(app: app, isSelected: self.selectedApp == app)
            }
        }
    }
}

struct AppListing_Previews: PreviewProvider {
    static var previews: some View {
        AppListing(apps: workSpaceData[0].apps, selectedApp: workSpaceData[0].apps[0])
    }
}
