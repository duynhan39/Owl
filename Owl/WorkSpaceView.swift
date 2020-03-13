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
    @Binding var workSpace: WorkSpace?
    @State var selectedApp : App?
    var browserTabs : [App?:BrowserView]
    
    var seenSoFar : [App]
    var appStack : [App]
    {
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
        
        var stack : [App] = workSpace?.apps ?? []
        if selectedApp != nil {
            stack.swapAt(stack.firstIndex(of: selectedApp!) ?? 0, stack.count-1)
        }
        
        return stack
        
    }
    
    init(workSpace: WorkSpace?) {
        self.workSpace = workSpace
        self.selectedApp = nil
        self.browserTabs = [App?:BrowserView]()
        self.seenSoFar = [App]()
        
        for app in workSpace?.apps ?? [] {
            browserTabs[app] = BrowserView(app: app)
        }
    }
    
    func goBack() {
        print("Go back")
    }
    
    var body: some View {
        HStack(spacing: 0) {
            
//            if (space != nil) {
                
                VStack {
                    Button(action: goBack) {
                        Image(nsImage: NSImage(named: NSImage.goBackTemplateName)!)
                    }
                    
                    
                    AppListing(apps: workSpace?.apps, selectedApp: $selectedApp)
                    
                    Button(action: goBack) {
                        Image(nsImage: NSImage(named: NSImage.addTemplateName)!)
                    }
                }
                .padding(5)
                .background(Color.init(red: 0.89, green: 0.74, blue: 0.46))
                
                ZStack {
                    ForEach(appStack) { app in
                        self.browserTabs[app]
                    }
                    
                    if selectedApp == nil {
                        Color.yellow
                    }
                    
                }
//            }
        }
        //.frame(minWidth: .infinity, minHeight: .infinity)
    }
}


struct WorkSpaceNavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceView(workSpace: nil)
//        WorkSpaceView(space: nil, selectedApp: nil)
    }
}
