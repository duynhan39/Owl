//
//  SpaceInfoView.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct WorkSpaceRow: View {
    var space: WorkSpace
    
    let textColor = Color(NSColor.textColor)
    let backgroundColor = Color(NSColor.windowBackgroundColor)
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(space.title)
                    .fontWeight(.bold)
                    .truncationMode(.tail)
                    .frame(minWidth: 20)
                    .foregroundColor(textColor)
                    
                Text(space.description)
                    .font(.caption)
                    .opacity(0.625)
                    .truncationMode(.middle)
                    .frame(minWidth: 20)
                    .foregroundColor(textColor)
            }
            Spacer()
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(4)
    }
}

struct SpaceInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceRow(space: workSpacesInfo[1])
    }
}
