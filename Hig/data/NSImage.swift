//
//  NSImage.swift
//  Hig
//
//  Created by Ana Soares on 10/06/26.
//

import Foundation
import Nuvem
import AppKit

extension NSImage: @retroactive CKAssetFieldValue {
    
    public static func get(_ recordValue: Data) -> Self? {
        return Self(data: recordValue)
    }
    
    public static func set(_ recordValue: NSImage?) -> Data? {
        return recordValue?.tiffRepresentation!
    }
    
}
