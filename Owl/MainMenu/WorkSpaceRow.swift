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
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(space.title)
                    .fontWeight(.bold)
                    .truncationMode(.tail)
                    .frame(minWidth: 20)
                    
                Text(space.description)
                    .font(.caption)
                    .opacity(0.625)
                    .truncationMode(.middle)
                    .frame(minWidth: 20)
            }
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

struct SpaceInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceRow(space: workSpaceData[1])
    }
}
