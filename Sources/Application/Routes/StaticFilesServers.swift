//
//  File.swift
//  
//
//  Created by Linck, Vinicius on 11/14/19.
//

import Foundation
import Kitura
import LoggerAPI

func initializeStaticFileServers(app: App) {
    app.router.all("/chat", middleware: StaticFileServer(path: "./client/chat"))
}
