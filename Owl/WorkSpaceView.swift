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
    var appStack : [App]
    {
        var stack : [App] = workSpace?.apps ?? []
        if selectedApp != nil {
            stack.swapAt(stack.firstIndex(of: selectedApp!) ?? 0, stack.count-1)
        }
        
        return stack
        
    }
    
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
        withAnimation(.linear) {
            workSpace = nil
            selectedApp = nil
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
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
        }
    }
}


struct WorkSpaceNavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceView(workSpace: .constant(workSpaceData[1]) , selectedApp: nil)
    }
}

