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

struct WorkSpaceAppListing: View {
    var apps: [App]?
    @Binding var selectedApp: App?
    
    var body: some View {
        
        VStack {
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

struct AppListing_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceAppListing(apps: workSpaceData[0].apps, selectedApp: .constant(workSpaceData[0].apps[0]))
    }
}
