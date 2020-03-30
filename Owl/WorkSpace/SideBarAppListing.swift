//
//  AppListing.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct AppButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}

struct SideBarAppListing: View {
    var apps: [AppInfo]?
    @Binding var selectedApp: AppInfo?
    
    var body: some View {
        
        ScrollView {
            ForEach(apps ?? []) { app in
                Button(action: {
                    self.selectedApp = app
                })
                {
                    AppIcon(app: app, isSelected: self.selectedApp == app)
                }.buttonStyle(AppButtonStyle())
            }
            Spacer()
        }
    }
}

struct SideBarAppListing_Previews: PreviewProvider {
    static var previews: some View {
        SideBarAppListing(apps: workSpacesInfo[0].apps, selectedApp: .constant(workSpacesInfo[0].apps[0]))
    }
}
