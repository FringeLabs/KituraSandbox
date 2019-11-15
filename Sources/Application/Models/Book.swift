//
//  File.swift
//  
//
//  Created by Linck, Vinicius on 11/14/19.
//

import Foundation
import Kitura
import KituraContracts

// Book is a sample struct used in the Codable routes
public struct Book: Codable {
    
    //MARK: Properties
    
    var name: String
    var author: String
    var rating: Int
    
}

public struct BookQuery: QueryParams {
    public let name: String?
}
