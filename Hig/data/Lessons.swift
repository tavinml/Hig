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
    @CKField("number")
    var number: Int
    @CKField("image")
    var image: String
    @CKField("moduleType")
    var moduleType: String
    @CKReferenceListField("challenge")
    var challenges: [Challenge]
    @CKReferenceListField("content")
    var contents: [Content]
    @CKField("titleLesson")
    var titleLesson: String
}



