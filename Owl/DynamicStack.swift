//
//  DynamicViewStack.swift
//  Owl
//
//  Created by Nhan Cao on 4/1/20.
//  Copyright © 2020 Nhan Cao. All rights reserved.
//

import SwiftUI

class THIS {
    
}

class DynamicStack<D, M> where D: Hashable {
//    associatedtype T
    @State var selectedObject : D?
    @State var stack = [D]()
    @State var tabs = [D:M]()
    
    func getNewTab(of object: D) -> M? {
        return nil
    }
    
    func select(object: D) {
//        print(app)
        selectedObject = object
        if tabs[object] == nil {
            tabs[object] = getNewTab(of: object)
            stack += [object]
        }
        stack.swapAt(stack.firstIndex(of: object) ?? 0, stack.count-1)
    }
    
    func remove(object: D) {
        if (selectedObject != nil) {
            tabs.removeValue(forKey: object)
            stack.removeAll { $0 == object }
        }
    }
}
