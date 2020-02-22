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
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: NSViewRepresentableContext<WebBrowserView>) {
        let request = URLRequest(url: URL(string: "https://google.com")!)
        nsView.load(request)
    }

}

struct WorkSpaceNavigationDetail: View {
    var space: WorkSpace
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        WebBrowserView()
        
        
        
    }
    
    
}


struct SpaceView_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceNavigationDetail(space: workSpaceData[0])
    }
}
