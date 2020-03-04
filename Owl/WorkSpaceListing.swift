//
//  SpaceListView.swift
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
                    .foregroundColor(Color.black)
                    
                Text(space.description)
                    .font(.caption)
                    .opacity(0.625)
                    .truncationMode(.middle)
                    .frame(minWidth: 20)
                    .foregroundColor(Color.gray)
            }.padding(10)
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

struct WorkSpaceListing: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(userData.spaces) { space in
                WorkSpaceRow(space: space)
                    .background(Color.init(red: 250, green: 242, blue: 229))
                    .cornerRadius(3)
            }//.listRowBackground(Color.red.padding())
            Spacer()
            
        }
        .padding()
        .background(Color.init(red: 255/255, green: 222/255, blue: 171/255))
        
        
        //        .navigationBarTitle("Spaces")
        
    }
}

struct SpaceListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceListing()
            .environmentObject(UserData())
    }
}
