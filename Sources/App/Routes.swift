import Vapor
import PostgreSQLDriver

extension Droplet {
    func setupRoutes() throws {
        
    // Another way to fetch tablenames
    //            let tableNames = self.config.preparations.map { $0.name }
    //            let tableNode = try Node(node: tableNames)
    //            return try JSON(node: tableNode)
        
        // Fetch all tables from db
        get("admin") { request in
            if let db = self.database {
                let tables = try db.raw("SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE';")
                let params = try Node(node: ["tables": tables])
                return String(describing: params)//drop.view.make("tables", params)
            } else {
                return "No db connection"
            }
        }
        
        // Route to show all posts
        get("allPosts") { request in
            return try Post.all().makeJSON()
        }
        
        // The challenge is here!!
        // Get all rows from the specified model and fetch and return all of it's rows
        get("rows") { request in
            return "rows"
//            let type = self.config.preparations[0].makeNode()
//            let name = try Model.init(from: type, in: nil).all()
//            guard let tablename = request.data["tablename"]?.string else { return "No tablename sent" }
//        
//            if let db = drop.database?.driver as? PostgreSQLDriver {
//                let objects = try db.raw("SELECT * FROM \(tablename);")
//                print(type(of: objects))
//                let params = try Node(node: ["acronyms": objects])
//                return try drop.view.make("index", params)
//            } else {
//                return "No db connection"
//            }
        }
        
        // Routes to add dummy data in db
        get("addAcronym") { request in
            let acronym = Acronym(short: "LOL", long: "Laughing out loud")
            try acronym.save()
            return "Acronym saved"
        }
        
        get("addPost") { request in
            let post = Post(content: "Something to post")
            try post.save()
            return "Post saved"
        }
    }
}
