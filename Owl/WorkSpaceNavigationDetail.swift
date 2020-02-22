//
//  SpaceView.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI
import WebKit


struct WebBrowserView: NSViewRepresentable {
    typealias NSViewType = WKWebView
    let webView: WKWebView = WKWebView()

    func makeNSView(context: NSViewRepresentableContext<WebBrowserView>) -> WKWebView {
//        webView.navigationDelegate = context.coordinator
//        webView.uiDelegate = context.self
        
        guard let url = URL(string: "https://github.com/filimo/ReaderTranslator") else {
            print("FAILED TO LOAD PAGE")
            return webView
            
        }
        
//        let request = URLRequest(url: URL(string: "https://www.google.com/")!)
        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: NSViewRepresentableContext<WebBrowserView>) {
//        let request = URLRequest(url: URL(string: "https://www.google.com/")!)
//        nsVie/w.load(request)
    }

}

struct WorkSpaceNavigationDetail: View {
//    var space: WorkSpace
    
    var body: some View {
        VStack {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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


struct SpaceView_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceNavigationDetail() //(space: workSpaceData[0])
    }
}
