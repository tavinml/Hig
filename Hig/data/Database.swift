//
//  database.swift
//  Hig
//
//  Created by Ana Soares on 08/06/26.
//

import Foundation
import Nuvem
import CloudKit

//extension CKDatabse{
//    static let `defalut` = CKContainer(
//        identifier: "iCloud.com.AnaSoares.Hig"
//    ).publicCloudDatabase
//}
extension CKDatabase{
    static let `default` = CKContainer(
        identifier: "iCloud.com.AnaSoares.Hig")
        .publicCloudDatabase
}
