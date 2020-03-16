//
//  App.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import Foundation
import SwiftUI

struct App: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var officialName: String
    var url: String
}

extension App {
    var image: Image {
        ImageStore.shared.image(name: name)
    }
    
//    var selectedImage: Image {
//        ImageStore.shared.image(name: "\(name)Selected")
//    }
}

