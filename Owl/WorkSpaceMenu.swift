//
//  SwiftUIView.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct WorkSpaceMenu: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text("Spaces")
                .multilineTextAlignment(.leading)
                .font(.custom("Times New Roman", size: 40))
                .foregroundColor(Color.black)
                .padding()
                
            WorkSpaceListing()//.listStyle(SidebarListStyle())
        }.background(Color.yellow)
    }
}

struct WorkSpaceMenu_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceMenu()
        .environmentObject(UserData())
    }
}
