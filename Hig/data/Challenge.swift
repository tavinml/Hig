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
    @CKField("descriptionChallenge", default: DescriptionChallenge(descriptionTitle: "", descriptionFirst: "", descriptionSecond: ""))
    var descriptionChallenge: DescriptionChallenge
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
}

struct Areas: CKCodable {
    let values: [TappableArea]
}

struct TappableArea: Codable {
    let x: Double
    let y: Double
    let width: Double
    let height: Double
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

struct DescriptionChallenge: CKCodable {
    let descriptionTitle: String
    let descriptionFirst: String
    let descriptionSecond: String
}
