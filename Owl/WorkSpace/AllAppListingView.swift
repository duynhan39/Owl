//
//  AddAnApp.swift
//  Owl
//
//  Created by Nhan Cao on 3/13/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct AllAppListingView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Add a new app to your current Work Space")
            ScrollView {
                Grid(appData) { app in
                    VStack {
                        AppIcon(app: app, isSelected: true)
                        Text(app.officialName)
                    }
                }
                
            }
        }
    }
}

struct AddAnApp_Previews: PreviewProvider {
    static var previews: some View {
        AllAppListingView()
    }
}
