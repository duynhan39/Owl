//
//  BrowserView.swift
//  Owl
//
//  Created by Nhan Cao on 2/23/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI
import WebKit

struct Browser: NSViewRepresentable {
    typealias NSViewType = WKWebView
    let webView: WKWebView = WKWebView()
    var app: AppInfo?

    func makeNSView(context: NSViewRepresentableContext<Browser>) -> WKWebView {
        guard let urlString : String = app?.url else { return webView }
        guard let url = URL(string: urlString) else {
            print("FAILED TO LOAD \(urlString)")
            return webView
        }
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: NSViewRepresentableContext<Browser>) {        
    }
}

struct BrowserView: View {
    var app: AppInfo?
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                Browser(app: self.app)
//                    .tabItem {
//                    Text("Browser")
//                }
                .frame(height: geometry.size.height)
                .tag(1)
            }.frame(height: geometry.size.height)
        }
    }
}

struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserView(app: workSpacesInfo[0].apps[1])
    }
}
