//
//  SpaceView.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI
//import WebKit

struct WorkSpaceDetail: View {
    var space: WorkSpace
    @State var selectedApp : App?
    
    var body: some View {
        
//        if selectedApp == nil && space.apps.count != 0 {
//            selectedApp = space.apps[0]
//            print("HERER")
//            print("selApp: \(selectedApp), count: \(space.apps.count)")
//        }
        
        return HStack(alignment: .top, spacing: 0) {
            
            AppListing(apps: space.apps, selectedApp: selectedApp)
            BrowserView(app: selectedApp)
            
        }//.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct WorkSpaceNavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceDetail(space: workSpaceData[0], selectedApp: workSpaceData[0].apps[0])
    }
}
