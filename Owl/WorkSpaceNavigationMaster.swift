//
//  SwiftUIView.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct WorkSpaceNavigationMaster: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(" Spaces")
                .multilineTextAlignment(.leading)
                .font(.custom("Times New Roman", size: 30))
                
            WorkSpaceList()//.listStyle(SidebarListStyle())
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceNavigationMaster()
        .environmentObject(UserData())
    }
}
