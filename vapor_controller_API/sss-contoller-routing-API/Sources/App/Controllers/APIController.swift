//
//  File.swift
//
//
//  Created by Aniello Ambrosio on 24/03/22.
//

import Foundation
import Vapor

struct Pianeta : Content{
    let name : String
    let galaxy : String
    let populated : Bool
    let physic : Physic?
}

struct Physic : Content{
    let diameter : Int
    let density : Float
}

struct APIController: RouteCollection{
    
    func boot(routes: RoutesBuilder) throws {
        
        let api = routes.grouped("api")
        api.get("planets", use: getPlanet)
        api.post("planets", use: create)
    }
    
    func create(req: Request) throws -> HTTPStatus{
        let planet = try req.content.decode(Pianeta.self)
        print(planet)
        return HTTPStatus.ok
        
    }
    
    func getPlanet(req: Request) throws-> /*Response*/ [Pianeta]{
        
//        let planets = [["name":"mars","galaxy":"milky way"],["name":"Jupiter","galaxy":"milky way"]]
//        let data = try JSONSerialization.data(withJSONObject: planets, options: .prettyPrinted)
//        return Response(status: .ok, body: Response.Body(data: data))
        let physic = Physic(diameter: 12742, density: 5.51)
        let planet = Pianeta(name: "Earth", galaxy: "Milky Way", populated: true,physic: physic)
        return [planet]
    }
    
}
