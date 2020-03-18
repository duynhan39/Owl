//
//  AddAnApp.swift
//  Owl
//
//  Created by Nhan Cao on 3/13/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct AppPickerView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
//    let rightColumnWidth = GeometryPreferenceReader(
//        key: AppendValue<RightColumnWidth>.self,
//        value: { [$0.size.width] }
//    )
    let buttonWidth: CGFloat = 100
    
    func cancel() {
        print("Cancel")
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func add() {
        print("Add")
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Add a new app to your current Work Space")
                .padding()
            
            ScrollView {
                Grid(appData) { app in
                    VStack {
                        AppIcon(app: app, isSelected: true)
                        Text(app.officialName)
                            .foregroundColor(Color(NSColor.textColor))
                    }
                }
            }.gridStyle(
                ModularGridStyle(columns: .min(100), rows: .fixed(100))
            )
            
            HStack {
                Button("Cancel", action: cancel)
//                    .frame(width: buttonWidth)
                Spacer()
                Button("Add", action: add)
//                    .frame(width: buttonWidth)
//                {
//                    Text("Add")
//                        .foregroundC .olor(Color(NSColor.controlAccentColor))
//                }
//                .background(RoundedRectangle(cornerRadius: 5, style: .continuous))
//                    .buttonStyle()
//                .foregroundColor(Color(NSColor.controlAccentColor))
//                    .clipped()
//                 .clipped()
//                    .background(Color(NSColor.controlAccentColor))
                
//                .buttonStyle(AppButtonStyle())
//                    .cornerRadius(5)
//                    .colorMultiply(Color(NSColor.controlAccentColor))
                
            }.padding()
            
        }.frame(width: 600, height: 450)
            .background(Color(NSColor.windowBackgroundColor) )
//        .assignMaxPreference(for: rightColumnWidth.key, to: $buttonWidth)
    }
}

struct AddAnApp_Previews: PreviewProvider {
    static var previews: some View {
        AppPickerView()
    }
}
