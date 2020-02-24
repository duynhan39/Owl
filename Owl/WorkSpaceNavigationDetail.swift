//
//  SpaceView.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI
import WebKit

struct AppListing: View {
    var selectedApp: App?
    var apps: [App]
    var body: some View {
        VStack {
            ForEach(apps) { app in
                AppIconSideBar(app: app, isSelected: self.selectedApp == app)
            }
        }
    }
}

struct WebBrowserView: NSViewRepresentable {
    typealias NSViewType = WKWebView
    let webView: WKWebView = WKWebView()

    func makeNSView(context: NSViewRepresentableContext<WebBrowserView>) -> WKWebView {
        guard let url = URL(string: "https://gmail.com") else {
            print("FAILED TO LOAD PAGE")
            return webView
        }
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: NSViewRepresentableContext<WebBrowserView>) {}
}


struct WorkSpaceNavigationDetail: View {
    var space: WorkSpace
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            
            AppListing(selectedApp: space.apps[0],  apps: space.apps)
            
            GeometryReader { g in
                ScrollView {
                    WebBrowserView().tabItem {
                        Text("Browser")
                    }
                    .frame(height: g.size.height)
                    .tag(1)

                }.frame(height: g.size.height)
            }
        }
    }
}


struct WorkSpaceNavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceNavigationDetail(space: workSpaceData[0])
    }
}
