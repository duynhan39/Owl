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
    var browserTabs : [App:BrowserView]
    var seenSoFar : [App]
    
    var appStack : [App] {
        var stack : [App] = workSpace?.apps ?? []
        if selectedApp != nil {
            stack.swapAt(stack.firstIndex(of: selectedApp!) ?? 0, stack.count-1)
        }
        return stack
    }
    
    @State var showAppPicker: Bool = false
    
    init(workSpace: Binding<WorkSpace?>, selectedApp: App?) {
        self.browserTabs = [App:BrowserView]()
        self.seenSoFar = []
        self._workSpace = workSpace
        self.selectedApp = selectedApp
        
        for app in self.workSpace?.apps ?? [] {
            browserTabs[app] = BrowserView(app: app)
        }
    }
    
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
                
                WorkSpaceAppListing(apps: workSpace?.apps, selectedApp: $selectedApp)
                
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
            AppPickerView()
        }
//        .gridStyle(
//            self.style
//        )
    }
}


struct WorkSpaceNavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceView(workSpace: .constant(nil) , selectedApp: nil)
    }
}

