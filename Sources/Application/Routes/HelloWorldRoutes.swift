//
//  File.swift
//  
//
//  Created by Linck, Vinicius on 11/14/19.
//

func initializeHelloWorldRoutes(app: App) {
    
    // Handle HTTP GET requests to /
    app.router.get("/") {
        request, response, next in
        response.send("Hello, World!")
        next()
    }
    
    // Handle HTTP GET requests to /echo/
    app.router.get("/echo/:name?") {
        request, response, next in
        
        if let name = request.parameters["name"] {
            response.send("Hello, \(name)! ")
        } else {
            response.send("Hello! ")
        }
        next()
    }
    
    app.router.get("/echo/:name?") {
        request, response, next in
        response.send("How are you doing today?")
        next()
    }
}
