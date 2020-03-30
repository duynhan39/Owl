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
//    @State var selections : [Int] = [0,1,2,3,4]
    @Binding var workSpace : WorkSpace?
    
    let data = workSpacesInfo
    
    let buttonWidth: CGFloat = 100
    
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func cancel() {
        print("Cancel")
        dismiss()
    }
    
    func selectApp(app : AppInfo) {
        print("Selected app \(app)")
        
        if workSpace != nil {
            let newApp = App(appName: app.name, id: workSpace?.getNewAppID() ?? 0)
            workSpace?.apps += [ newApp ]
        }
        
//        save(from: workSpacesD, to: DataFile.workSpace)
        save(option: DataFile.workSpace)
        dismiss()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Add a new app to your current Work Space")
                .padding()
            
            ScrollView {
                Grid(appsInfoArray) { app in
                    Button(action: {
//                        self.selectedApp = app
                        self.selectApp(app: app)
                        
                    })
                    {
                        VStack {
                            AppIcon(app: app, isSelected: true)
                            Text(app.officialName)
                                .foregroundColor(Color(NSColor.textColor))
                        }
                    }.buttonStyle(AppButtonStyle())
                }
                
            }.gridStyle(
                ModularGridStyle(columns: .min(100), rows: .fixed(100))
            )
            
            
            HStack {
                Button("Cancel", action: cancel)
//                    .frame(width: buttonWidth)
                Spacer()
//                Button("Add", action: add)
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
        AppPickerView(workSpace: .constant(workSpacesInfo[0]))
    }
}


//extension Int: Identifiable {
//    public var id: Int {
//        return self
//    }
//
//}

