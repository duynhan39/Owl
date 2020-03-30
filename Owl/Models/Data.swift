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

class JSONWorkSpace : Hashable, Codable, Identifiable  {
    var content:[WorkSpace]?
    
    static func == (lhs: JSONWorkSpace, rhs: JSONWorkSpace) -> Bool {
        return lhs.content == rhs.content
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(content)
    }
}

class JSONApp : Hashable, Codable, Identifiable  {
    var content:[AppInfo]?
    
    static func == (lhs: JSONApp, rhs: JSONApp) -> Bool {
        return lhs.content == rhs.content
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(content)
    }
}

struct DataFile {
    static let workSpace = "workSpaceData.json"
    static let appData = "appData.json"
}

//var workSpacesData = JSONData<WorkSpace>(DataFile.workSpace)
//let workSpacesData = load(DataFile.workSpace)

let workSpacesData : JSONWorkSpace = load(DataFile.workSpace) ?? JSONWorkSpace()
let workSpacesInfo: [WorkSpace] = workSpacesData.content ?? []

let appsData : JSONApp = load(DataFile.appData) ?? JSONApp()
let appsInfo: [AppInfo] = appsData.content ?? []

func getURL(of filename: String, isResources: Bool) -> URL {
    if isResources {
        guard let url = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("[\(#file)]: Couldn't find \(filename) in main bundle to load data")
        }
        return url
    } else {
        guard let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            else {
                fatalError("[\(#file)]: Couldn't find \(filename) in main bundle to load data")
        }
        let url = file.appendingPathComponent(filename)
        return url
    }
}

func load<T: Decodable>(_ filename: String) -> T? {
    var url = getURL(of: filename, isResources: false)
    if FileManager.default.fileExists(atPath: url.path){
        return loadJSON(url)
    }
    
    url = getURL(of: filename, isResources: true)
    if FileManager.default.fileExists(atPath: url.path){
        return loadJSON(url)
    }
    
    return nil
}

func loadJSON<T: Decodable>(_ url: URL) -> T {
    let data: Data

    do {
        data = try Data(contentsOf: url)
        print(data)
    } catch {
        fatalError("[\(#file)]: Couldn't load \(url.path) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("[\(#file)]: Couldn't parse \(url.path) as \(T.self):\n\(error)")
    }
}

func save(option: String) {
    switch option {
    case DataFile.appData:
        save(from: appsData, to: option)
    case DataFile.workSpace:
        save(from: workSpacesData, to: option)
    default:
        return
    }
}

func save<T: Encodable>(from data: T, to filename: String) {
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//        else {
//            fatalError("[\(#file)]: Couldn't find \(filename) in main bundle to load data")
//    }
//
//    do {
//        let content = try JSONEncoder().encode(data)
//        try content.write(to: file)
//    } catch {
//        fatalError("[\(#file)]: Couldn't save data to \(filename):\n\(error)")
//    }
    
    guard let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else {
            fatalError("[\(#file)]: Couldn't find \(filename) in main bundle to load data")
    }
    let url = file.appendingPathComponent(filename)
    
//    print(fileURL)
    do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let jsonData = try
//            JSONSerialization.data(withJSONObject: data, options: [])
            encoder.encode(data)
        let jsonString = String(data: jsonData, encoding: .utf8)
        print(jsonString!)
        try jsonData.write(to: url)
        
    } catch {
        print(error.localizedDescription)
    }
}
    


final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "png"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            guard
                let url = Bundle.main.url(forResource: "blank", withExtension: "png"),
                let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
                let blankImage = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
            else {
                fatalError("Couldn't load image \(name).png and placeholder blank.png from main bundle.")
            }
            return blankImage
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}



