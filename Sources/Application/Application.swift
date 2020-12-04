//
//  File.swift
//  
//
//  Created by Linck, Vinicius on 11/14/19.
//

import Foundation
import Kitura
import Health
import KituraOpenAPI


public let health = Health()

public class App {
    let router = Router()
    
     public init() throws {
        // Run the metrics initializer
        initializeMetrics(router: router)
    }
    
    func postInit() throws {
        // HTTP endpoints
        initializeHelloWorldRoutes(app: self)
        initializeCodableRoutes(app: self)
        
        // Statics Files
        initializeStaticFileServers(app: self)
        
        // OpenAPI
        KituraOpenAPI.addEndpoints(to: router)
        
        // The not found route must be last since it matches all requests.
        initializeNotFoundRoute(app: self)
    }
    
    func getPort() -> Int {
        // Resolve the port that we want the server to listen on.
        let port: Int
        let defaultPort = 8080
        
        if let requestedPort = ProcessInfo.processInfo.environment["PORT"] {
            port = Int(requestedPort) ?? defaultPort
        } else {
            port = defaultPort
        }
        
        return port
    }
    
    public func run() throws {
        try postInit()
        
        Kitura.addHTTPServer(onPort: getPort(), with: router)
        Kitura.run()
    }
}
