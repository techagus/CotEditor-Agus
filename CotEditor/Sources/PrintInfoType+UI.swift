//
//  PrintOptions.swift
//
//  CotEditor
//  https://coteditor.com
//
//  Created by 1024jp on 2023-08-04.
//
//  ---------------------------------------------------------------------------
//
//  © 2023 1024jp
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  https://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import AppKit.NSMenuItem


extension PrintInfoType {
    
    static var menuItems: [NSMenuItem] {
        
        [Self.none.menuItem, .separator()] + Self.allCases[1...].map(\.menuItem)
    }
    
    
    private var menuItem: NSMenuItem {
        
        let item = NSMenuItem()
        item.title = self.label
        item.tag = Self.allCases.enumerated().first { $0.element == self }?.offset ?? 0
        return item
    }
}


extension AlignmentType {
    
    static func setup(segmentedControl: NSSegmentedControl) {
        
        for type in self.allCases {
            segmentedControl.setToolTip(type.help, forSegment: type.rawValue)
            segmentedControl.setTag(type.rawValue, forSegment: type.rawValue)
            segmentedControl.setImage(NSImage(systemSymbolName: type.symbolName, accessibilityDescription: type.help), forSegment: type.rawValue)
        }
    }
}
