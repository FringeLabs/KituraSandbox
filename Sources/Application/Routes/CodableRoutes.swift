//
//  File.swift
//  
//
//  Created by Linck, Vinicius on 11/14/19.
//

import KituraContracts

func initializeCodableRoutes(app: App) {
    
   //Codable route for post
    app.router.get("/books", handler: app.queryGetHandler)
    app.router.post("/books", handler: app.postBookHandler)
    app.router.delete("/books", handler: app.deleteAllBookHandler)
}

extension App {
    func queryGetHandler(query: BookQuery, respondWith: ([Book]?, RequestError?) -> Void) {
        return respondWith([], nil)
    }

    func postBookHandler(book: Book, completion: (Book?, RequestError?) -> Void ) {
        return completion(nil, nil)
    }

    func deleteAllBookHandler(completion: (RequestError?) -> Void) {
        return completion(nil)
    }
}
