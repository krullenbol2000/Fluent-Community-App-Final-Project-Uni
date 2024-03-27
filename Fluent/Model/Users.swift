//
//  Users.swift
//  Fluent
//
//  Created by Louise Mostovicz on 27/05/2022.
//

/*import Foundation
struct UsersResults : Decodable {
    let value : [Person]
    let status : String
    let message : String

}

enum UsersError: Error {
    case invalidURL
 }

struct Users {
    static var users : [Person] = []
    
   users = [Person(id: 0, name: "a", imageURLS: [URL(string: "about:blank")!], tlanguages: ["en"], nlanguage: "fr", bio: "n/a"),
                 Person(id: 1, name: "b", imageURLS: [URL(string: "about:blank")!], tlanguages: ["en"], nlanguage: "fr", bio: "n/a"),
                 Person(id: 2, name: "c", imageURLS: [URL(string: "about:blank")!], tlanguages: ["en"], nlanguage: "fr", bio: "n/a"),
                 Person(id: 3, name: "d", imageURLS: [URL(string: "about:blank")!], tlanguages: ["en"], nlanguage: "fr", bio: "n/a"),
                 ]
  
    static func loadData() {
        guard let url = URL(string: "http://127.0.0.1:5000/users") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(UsersResults.self, from: data) {
                    DispatchQueue.main.async {
                        print(response.value)
                        self.users = response.value
                    }
                }
            }
        }.resume()
    }
  
    
}
*/
