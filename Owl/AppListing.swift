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

struct AppListing: View {
    var apps: [App]
    @Binding var selectedApp: App?
    
    var body: some View {
        
        VStack {
//            Text("Hi")
            ForEach(apps) { app in
                Button(action: {
                    self.selectedApp = app
                    print(app)
                })
                {
                AppIconSideBar(app: app, isSelected: self.selectedApp == app)
                    
                }.buttonStyle(AppButtonStyle())
                //.frame(minWidth: 50, idealWidth: 50, maxWidth: 100, minHeight: 50, idealHeight: 50, maxHeight: 100, alignment: <#T##Alignment#>)
            }
            Spacer()
        }
    }
}

struct AppListing_Previews: PreviewProvider {
    static var previews: some View {
        AppListing(apps: workSpaceData[0].apps, selectedApp: .constant(workSpaceData[0].apps[0]))
    }
}
