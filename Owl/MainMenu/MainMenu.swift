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
    
    @State var selectedSpace : WorkSpace?
    @State var workSpaceStack = [WorkSpace]()
    @State var workSpaceViewTabs = [WorkSpace: WorkSpaceView]()
    
    @Environment(\.colorScheme) var colorScheme
    
    
    func addWorkSpace() {
        print("Add new workSpace")
    }
    
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading, spacing: 6) {
                VStack(alignment: .leading) {
                    Text("Hi \(userData.firstName)")
                        .font(.custom("Times New Roman", size: 60))
                    
                    Text("What do you want to work on today?")
                        .font(.custom("Times New Roman", size: 20))
                }.padding()
                
                ZStack {
                    WorkSpaceListing(allSpaces: $allSpaces, presentedSpace: $selectedSpace)
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Button(action: addWorkSpace) {
                                Image(nsImage: NSImage(named: NSImage.addTemplateName)!)
                                    .padding()
                            }
                                
                            .buttonStyle(ClickableRoundButtonStyle())
                            .overlay(
                                Capsule(style: .circular)
                                    .stroke(UserPreference.primaryColor, lineWidth: colorScheme == .dark ? 1 : 0)
                            )
                                .shadow(color: UserPreference.textColor.opacity(colorScheme == .light ? 1 : 0), radius: 2, x: 1, y: 1)
                            
                            
                            Spacer()
                        }
                    }.padding(UserPreference.paddingLength*2)
                }
            }
            
            
            
            
            GeometryReader { geometry in
                ZStack() {
                    WorkSpaceView(workSpace: self.$selectedSpace, selectedApp: nil)
                }.offset(x: 0, y: self.selectedSpace != nil ? 0 : geometry.size.height)
            }
        }
    }
}

struct WorkSpaceMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
        //            .environmentObject(UserData())
    }
}
