//
//  Challenge 2.swift
//  Hig
//
//  Created by Ana Soares on 10/06/26.
//
import Foundation
import CloudKit
import Nuvem
import AppKit


@CKModel
struct Challenge{
    @CKField("correctSection")
    var correctSection: Int
    @CKField("correctFeedback")
    var correctFeedback: String
    @CKField("wrongFeedback")
    var wrongFeedback: String
    @CKField("descriptionChallenge")
    var descriptionChallenge: String
    @CKAssetField("imageChallenge")
    var imageChallenge: NSImage
    @CKAssetListField("imageChat")
    var imageChat: [NSImage]
    @CKField("titleChallenge")
    var titleChallenge: String
    @CKField("tappableArea")
    var area: String
}
