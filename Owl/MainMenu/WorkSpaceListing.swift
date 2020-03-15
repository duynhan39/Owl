//
//  SpaceListView.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct WorkSpaceListing: View {
    @EnvironmentObject private var userData: UserData
    @Binding var presentedSpace : WorkSpace?
    
    var body: some View {
        List {
            ForEach(userData.allSpaces) { space in
                
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

struct SpaceListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceListing(presentedSpace: .constant(workSpaceData[1]))
            .environmentObject(UserData())
    }
}
