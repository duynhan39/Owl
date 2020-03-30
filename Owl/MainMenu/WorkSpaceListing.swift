//
//  SpaceListView.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct WorkSpaceListing: View {
    @Binding var allSpaces : [WorkSpace]
    @Binding var presentedSpace : WorkSpace?
    
    let paddingLength : CGFloat = 6
    
    var body: some View {
        ScrollView {
            ForEach(allSpaces.indices) { index in
                Button(action: {
                    withAnimation() {
                        self.presentedSpace = self.allSpaces[index]
//                        print(self.presentedSpace)
                    }
                }) {
                    WorkSpaceRow(space: self.allSpaces[index])
                }
                .buttonStyle(AppButtonStyle())
            }
            .padding(paddingLength)
            
            Spacer()
        }
        .padding(Edge.Set.all, paddingLength)
//        .padding(Edge.Set.bottom, paddingLength)
        .background(Color.yellow)
        
        //.foregroundColor(Color.red)
        
    }
}

struct SpaceListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceListing(allSpaces: .constant(workSpacesInfo), presentedSpace: .constant(nil))
            .environmentObject(UserData())
    }
}
