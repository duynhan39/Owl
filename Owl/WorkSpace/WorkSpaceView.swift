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
    @State var browserTabs = [App:BrowserView]()
    @State var appStack = [App]()
    
    @State var showAppPicker: Bool = false

    func goBack() {
        withAnimation() {
            workSpace = nil
            selectedApp = nil
        }
    }
    
    func addApp() {
        print("Add app")
        withAnimation() {
            showAppPicker = true
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Button(action: goBack) {
                    Image(nsImage: NSImage(named: NSImage.touchBarGoDownTemplateName)!)
                }
                
                SideBarAppListing(workSpace: workSpace ?? WorkSpace(), selectedApp: $selectedApp, delegate: self)
                
                Button(action: addApp) {
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
        }
        .sheet(isPresented: self.$showAppPicker) {
            AppPickerView(workSpace: self.$workSpace)
        }
    }
}


struct WorkSpaceNavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceView(workSpace: .constant(nil) , selectedApp: nil)
    }
}

protocol ModifyableAppStack {
    func select(app: App)
    func remove(app: App)
}


extension WorkSpaceView: ModifyableAppStack {
    
    func select(app: App) {
        selectedApp = app
        if browserTabs[app] == nil {
            browserTabs[app] = BrowserView(app: app)
            appStack += [app]
        }
        appStack.swapAt(appStack.firstIndex(of: app) ?? 0, appStack.count-1)
    }
    
    func remove(app: App) {
        if (selectedApp != nil) {
            browserTabs.removeValue(forKey: app)
            appStack.removeAll { $0 == app }
        }
    }
}
