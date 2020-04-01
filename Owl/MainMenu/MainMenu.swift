//
//  SwiftUIView.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct MainMenu: View {
    @State var allSpaces = workSpacesInfo
    @State var presentedSpace : WorkSpace? //= workSpaceData[0]
    var body: some View {
        
        ZStack {
             VStack(alignment: .leading, spacing: 6) {
                VStack(alignment: .leading) {
                Text("Hi Nhan")
                    .font(.custom("Times New Roman", size: 60))
                
                Text("What do you want to work on today?")
                    .font(.custom("Times New Roman", size: 20))
                }.padding()
                
                WorkSpaceListing(allSpaces: $allSpaces, presentedSpace: $presentedSpace)
//                    .background(Color(NSColor.windowBackgroundColor))
            }
            
            GeometryReader { geometry in
                ZStack() {
                    WorkSpaceView(workSpace: self.$presentedSpace, selectedApp: nil)
                }.offset(x: 0, y: self.presentedSpace != nil ? 0 : geometry.size.height)
            }
        }
    }
}

struct WorkSpaceMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
            .environmentObject(UserData())
    }
}
