//
//  File.swift
//
//
//  Created by Aniello Ambrosio on 24/03/22.
//

import Foundation
import Vapor

struct PlanetController: RouteCollection{
    
    //boot function
    func boot(routes: RoutesBuilder) throws {
        
        let planet = routes.grouped("planets")
        
//      /planet
        planet.get(use: index)
        
//      /planet POST
        planet.post(use: create)
        
        planet.group(":nameofplanet"){ plan in
            plan.get(use: show)
        }
        
    }
    
    func index(req: Request) throws -> String{
        return "INDEX"
    }
    
    func create(req: Request) throws -> String{
        return "POST"
    }
    
    func show(req: Request) throws -> String{
        guard let nameofplanet = req.parameters.get("nameofplanet") as String? else {
            throw Abort(.badRequest)
        }
        return "\(nameofplanet)"
    }
    
    
}
