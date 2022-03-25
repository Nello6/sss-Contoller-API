import Vapor

func routes(_ app: Application) throws {
    
    try app.register(collection: PlanetController()) //Routing
    try app.register(collection: APIController()) //Json API

}
