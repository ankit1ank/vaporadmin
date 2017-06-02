import Vapor
import FluentProvider

final class Acronym: Model {
    let storage = Storage()
    
    var short: String
    var long: String
    
    init(short: String, long: String) {
        self.short = short
        self.long = long
    }
    
    init(row: Row) throws {
        short = try row.get("short")
        long = try row.get("long")
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("short", short)
        try row.set("long", long)
        return row
    }
}

extension Acronym: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string("short")
            builder.string("long")
        }
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}
