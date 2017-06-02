import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("admin") { request in
            return "admin"
//            let tableNames = drop.preparations.map { $0.self.name }
//            let tableNode = try Node(node: tableNames)
//            return try JSON(node: tableNode)
            
            //    if let db = drop.database?.driver as? PostgreSQLDriver {
            //        let tables = try db.raw("SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE';")
            //        let params = try Node(node: ["tables": tables])
            //        return try drop.view.make("tables", params)
            //    } else {
            //        return "No db connection"
            //    }
        }
        
        get("rows") { request in
            return "rows"
            //    let type = drop.preparations[0].makeNode()
            //    let name = try Model.init(from: type, in: nil).all()
            //    guard let tablename = request.data["tablename"]?.string else { return "No tablename sent" }
            //
            //    if let db = drop.database?.driver as? PostgreSQLDriver {
            //        let objects = try db.raw("SELECT * FROM \(tablename);")
            //        print(type(of: objects))
            //        let params = try Node(node: ["acronyms": objects])
            //        return try drop.view.make("index", params)
            //    } else {
            //        return "No db connection"
            //    }
        }
//        try resource("posts", PostController.self)
    }
}
