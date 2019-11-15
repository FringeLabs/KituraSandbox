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
    
    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
    }
}
