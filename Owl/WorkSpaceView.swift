//
//  SpaceView.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI
//import WebKit

struct WorkSpaceView: View {
    var space: WorkSpace
    @State var selectedApp : App?
    
    var body: some View {
        NavigationView {
            
            AppListing(apps: space.apps, selectedApp: $selectedApp)
            
            if selectedApp != nil {
                BrowserView(app: selectedApp!)
            }
        }
        //.frame(minWidth: .infinity, minHeight: .infinity)
    }
}


struct WorkSpaceNavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceView(space: workSpaceData[1], selectedApp: workSpaceData[1].apps[0])
    }
}
