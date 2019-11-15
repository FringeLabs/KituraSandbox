//
//  File.swift
//  
//
//  Created by Linck, Vinicius on 11/14/19.
//

import Foundation

import KituraWebSocket

public class TerminalService: WebSocketService {
      
    public init() {}

    private var connections = [String: WebSocketConnection]()

    public let connectionTimeout: Int? = 60

    public func connected(connection: WebSocketConnection) {
        connections[connection.id] = connection
    }

    public func disconnected(connection: WebSocketConnection, reason: WebSocketCloseReasonCode) {
        connections.removeValue(forKey: connection.id)
    }

    public func received(message: Data, from: WebSocketConnection) {
        from.close(reason: .invalidDataType, description: "Chat-Server only accepts text messages")

        connections.removeValue(forKey: from.id)
    }

    public func received(message: String, from: WebSocketConnection) {
        for (connectionId, connection) in connections {
            if connectionId != from.id {
                connection.send(message: message)
            }
        }
    }
}
