//
//  ModelManager.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/31.
//

import Foundation
import UIKit

var shareInstance = ModelManager()

class ModelManager {
   
   var database: FMDatabase? = nil
   
   static func getInstance() -> ModelManager {
       if shareInstance.database == nil {
        shareInstance.database = FMDatabase(path: Util.share.getPath(dbName: "HanagasakiDB.db"))
       }
       return shareInstance
   }
   // Save and delete from here
    func Save(article: modelArticle) -> Bool {
           shareInstance.database?.open()
           
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO note(articleTitle, url) VALUES(?,?)", withArgumentsIn: [article.articleTitle!, article.url!])
           
           shareInstance.database?.close()
           return isSave!
    }
    
    func SaveVideo(video: modelVideo) -> Bool {
           shareInstance.database?.open()
           
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO video(videoTitle, image, url) VALUES(?,?,?)", withArgumentsIn: [video.videoTitle!, video.image!, video.url!])
           
           shareInstance.database?.close()
           return isSave!
    }
    
    func getAllArticle() -> [modelArticle] {
        shareInstance.database?.open()
        var articles = [modelArticle]()
        do {
            let resultset : FMResultSet? = try shareInstance.database?.executeQuery("SELECT * FROM note", values: nil)
            if resultset != nil{
                while resultset!.next() {
                    let article = modelArticle(id: (resultset?.string(forColumn: "id")!), articleTitle: (resultset?.string(forColumn: "articleTitle")!), url: resultset?.string(forColumn: "url")!)
                    articles.append(article)
                }
            }
        }
        catch let err {
            print(err.localizedDescription)
        }
        shareInstance.database?.close()
        return articles
    }
    
    func getAllVideo() -> [modelVideo] {
        shareInstance.database?.open()
        var videos = [modelVideo]()
        do {
            let resultset : FMResultSet? = try shareInstance.database?.executeQuery("SELECT * FROM video", values: nil)
            if resultset != nil{
                while resultset!.next() {
                    let video = modelVideo(id: (resultset?.string(forColumn: "id")!), videoTitle: (resultset?.string(forColumn: "videoTitle")!), image: (resultset?.string(forColumn: "image")!), url: resultset?.string(forColumn: "url")!)
                    videos.append(video)
                }
            }
        }
        catch let err {
            print(err.localizedDescription)
        }
        shareInstance.database?.close()
        return videos
    }
}
