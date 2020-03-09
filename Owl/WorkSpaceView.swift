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
    var browserTabs = [App?:BrowserView]()
    
    var appStack: [App] {
//        var stack = [App]()
//        if selectedApp != nil {
//            stack = [selectedApp!]
//        }
//
//        for app in space.apps {
//            if app != selectedApp {
//                stack += [app]
//            }
//        }
        
        var stack = space.apps
        if selectedApp != nil {
            stack.swapAt(stack.firstIndex(of: selectedApp!) ?? 0, stack.count-1)
        }
        
        return stack
        
    }
    
    init(space: WorkSpace, selectedApp: App?) {
        self.space = space
        self.selectedApp = selectedApp
        for app in space.apps {
            browserTabs[app] = BrowserView(app: app)
        }
    }
    
    var body: some View {
        NavigationView {
            
            AppListing(apps: space.apps, selectedApp: $selectedApp)
            
//            if selectedApp != space.apps[1] {
//                BrowserView(app: selectedApp!)
//                Text("\(selectedApp?.name ?? "None")")
            ZStack {
//                ForEach(browserTabs) { tab in
//                    tab
//                }
            
                ForEach(appStack) { app in
                    self.browserTabs[app]
                }
//                browserTabs[selectedApp]
            }
//            } else {
//                Spacer()
//            }
        }
        //.frame(minWidth: .infinity, minHeight: .infinity)
    }
}


struct WorkSpaceNavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceView(space: workSpaceData[1], selectedApp: nil)
    }
}
