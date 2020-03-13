//
//  SwiftUIView.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct WorkSpaceMenu: View {
    @State var presentedSpace : WorkSpace? //= workSpaceData[0]
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(" Spaces")
                    .multilineTextAlignment(.leading)
                    .font(.custom("Times New Roman", size: 40))
                
                
                WorkSpaceListing(presentedSpace: $presentedSpace) //.listStyle(SidebarListStyle())
            }
            
            GeometryReader { geometry in
                ZStack() {
                    WorkSpaceView(workSpace: self.$presentedSpace, selectedApp: nil)
                }
                .offset(x: self.presentedSpace != nil ? 0 : geometry.size.width , y: 0)
            }
        }
    }
}

struct WorkSpaceListing: View {
    @EnvironmentObject private var userData: UserData
    @Binding var presentedSpace : WorkSpace?
    
    var body: some View {
        List {
            ForEach(userData.spaces) { space in
                
                Button(action: {
                    withAnimation() {
                        self.presentedSpace = space
//                        print(self.presentedSpace)
                    }
                }) {
                    WorkSpaceRow(space: space)
                }
                .buttonStyle(AppButtonStyle())
            }
        }
        
    }
}

struct WorkSpaceMenu_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceMenu()
            .environmentObject(UserData())
    }
}
