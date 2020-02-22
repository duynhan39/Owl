//
//  Data.swift
//  Owl
//
//  Created by Nhan Cao on 2/22/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import Foundation
import SwiftUI
import ImageIO

let workSpaceData: [WorkSpace] = load("workSpaceData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("[Data.swift]: Couldn't find \(filename) in main bundle to load data")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("[Data.swift]: Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("[Data.swift]: Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


