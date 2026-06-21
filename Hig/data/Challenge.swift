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
    @CKField("correctSection", default: 0)
    var correctSection: Int
    @CKField("correctFeedback", default: CorrectFeedack(correctTitle: "", correctFirst: "", correctSecond: ""))
    var correctFeedback: CorrectFeedack
    @CKField("wrongFeedback", default: WrongFeedack(wrongTitle: "", wrongFirst: "", wrongSecond: ""))
    var wrongFeedback: WrongFeedack
    @CKField("descriptionChallenge", default: []/* DescriptionChallenge(descriptionTitle: "", descriptionFirst: "", descriptionSecond: "")*/)
    var descriptionChallenge: [String]
    @CKAssetField("imageChallenge")
    var imageChallenge: NSImage
    @CKAssetListField("imageChat")
    var imageChat: [NSImage]
    @CKField("titleChallenge", default: "")
    var titleChallenge: String
    @CKField("tappableAreas", default: Areas(values: []))
    var area: Areas
    @CKField("titleChat")
    var titleChat: String
    @CKAssetField("finishedImage")
    var finishedImage: NSImage?
    @CKField("finishedAreas", default: Areas(values: []))
    var finishedArea: Areas
}

struct Areas: CKCodable {
    let values: [TappableArea]
}

struct TappableArea: Codable {
    let x: Double
    let y: Double
    let width: Double
    let height: Double
//    let description: String
}

struct WrongFeedack: CKCodable {
    let wrongTitle: String
    let wrongFirst: String
    let wrongSecond: String
}

struct CorrectFeedack: CKCodable {
    let correctTitle: String
    let correctFirst: String
    let correctSecond: String
}
//
//struct AttemptFeedack: CKCodable {
//    let AttemptTitle: String
//    let AttemptFirst: String
//    let AttemptSecond: String
//}
//
//struct DescriptionChallenge: CKCodable {
//    let descriptionTitle: String
//    let descriptionFirst: String
//    let descriptionSecond: String
//}
