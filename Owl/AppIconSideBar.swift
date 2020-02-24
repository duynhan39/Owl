//
//  AppIconSideBar.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

struct AppIconMeasures {
    static var iconEdge: CGFloat = 24
    static var innerPadding: CGFloat {
        return iconEdge * 0.3
    }
    static var outterPadding: CGFloat {
        return iconEdge * 0.3
    }
    static var stokerWidth: CGFloat {
        return iconEdge * 0.1
    }
}

struct AppIconSideBar: View {
    var app: App
    var isSelected: Bool
    var body: some View {
        
        var image: Image
            
        if isSelected{
            image = app.selectedImage
        } else {
            image = app.image
        }
            
        return image
            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
            .frame(width: AppIconMeasures.iconEdge, height: AppIconMeasures.iconEdge)
            .fixedSize(horizontal: true, vertical: false)
            .padding(AppIconMeasures.innerPadding)
//            .background(Color.gray)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: AppIconMeasures.stokerWidth))
            .padding(AppIconMeasures.outterPadding)
        
//        var view: Image
//        if isSelected {
//            view = image.background(Color.gray) as! Image
//        } else {
//            view = image as! Image
//        }
        
//        return view//.background(Color.black)
    }
}

struct AppIconSideBar_Previews: PreviewProvider {
    static var previews: some View {
        AppIconSideBar(app: workSpaceData[0].apps[0], isSelected: true)
    }
}
