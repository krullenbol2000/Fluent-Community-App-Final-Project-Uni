//
//  TempTest.swift
//  Fluent
//
//  Created by Louise Mostovicz on 01/06/2022.
//
/*
import SwiftUI

struct TempTest: View {
    @State var users = [Person]()
    var body: some View {
        Self._printChanges()
        return List(users, id: \.id) { person in
            VStack(alignment: .leading) {
                Text("Hello ")
                          Text(person.name)
        }
        }.onAppear(perform: loadData)

    }   
    func loadData() {
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
                      return
                  }
              }
          }.resume()
      }
   
}
 
    
struct TempTest_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TempTest()
            TempTest()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
*/
