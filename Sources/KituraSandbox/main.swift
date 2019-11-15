import Foundation
import Kitura
import LoggerAPI
import HeliumLogger
import KituraWebSocket
import Application
import KituraWebSocket
import ChatService

do {
    
    HeliumLogger.use(LoggerMessageType.info)
    WebSocket.register(service: ChatService(), onPath: "kitura-chat")
    WebSocket.register(service: TerminalService(), onPath: "terminal")
    

    let app = try App()
    try app.run()
    
} catch let error {
    Log.error(error.localizedDescription)
}
