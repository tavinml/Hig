//
//  Models.swift
//  Hig
//
//  Created by Ana Soares on 08/06/26.
//

import Foundation
import CloudKit
import Nuvem
import AppKit

@CKModel
struct Lessons{
    @CKField("number", default: 0)
    var number: Int
    @CKField("image", default: "")
    var image: String
    @CKField("moduleType", default: "")
    var moduleType: String
    @CKReferenceListField("challenge")
    var challenges: [Challenge]
    @CKReferenceListField("content")
    var contents: [Content]
    @CKField("titleLesson", default: "")
    var titleLesson: String
}



