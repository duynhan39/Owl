//
//  AddAnApp.swift
//  Owl
//
//  Created by Nhan Cao on 3/13/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct AppPickerView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Add a new app to your current Work Space")
                .padding()
            
            ScrollView {
                Grid(appData) { app in
                    VStack {
                        AppIcon(app: app, isSelected: true)
                        Text(app.officialName)
                            .foregroundColor(Color.secondary)
                        
                    }//.padding()
//                        .background(Color.yellow)
                        
//                        .offset(x: 0, y:50)
                    
                }
                //.background(Color.red)

                
            }.gridStyle(
                ModularGridStyle(columns: .min(100), rows: .fixed(100))
            )
//            .padding()
        }.frame(width: 600, height: 300)
            .background(Color.primary)
    }
}

struct AddAnApp_Previews: PreviewProvider {
    static var previews: some View {
        AppPickerView()
    }
}
