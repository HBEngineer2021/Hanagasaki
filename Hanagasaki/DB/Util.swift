//
//  Util.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/31.
//

import Foundation
import UIKit

class Util {
   
   static let share = Util()
   
   func getPath(dbName: String) -> String {
       let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
       let fileUrl = documentDirectory.appendingPathComponent(dbName)
    print(fileUrl.path)
       return fileUrl.path
   }
   
   func copyDatabase(dbName: String) {
       let dbPath = getPath(dbName: "HanagasakiDB.db")
       let fileManager = FileManager.default
       
       if !fileManager.fileExists(atPath: dbPath) {
           let bundle = Bundle.main.resourceURL
           let file = bundle?.appendingPathComponent(dbName)
           do {
               try fileManager.copyItem(atPath: file!.path, toPath: dbPath)
           }
           catch let err {
               print(err.localizedDescription)
           }
       }
   }
}
