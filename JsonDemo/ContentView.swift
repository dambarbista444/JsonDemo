//
//  ContentView.swift
//  JsonDemo
//
//  Created by Dambar Bista on 9/28/21.
//

import SwiftUI
import SwiftyJSON
import Alamofire

struct ContentView: View {

    @State private var profile: UserProfile!
    
    var body: some View {
        let profileData = getProfileDataFromJSON()
        
        VStack {
            Image("myPhoto")
                .resizable()
                .frame(maxWidth: 150, maxHeight: 150)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            
            Text(profileData.person.name)
                .fontWeight(.bold)
                .font(.title)
    
            
            HStack {
                VStack() {
                    Text("Hobbies")
                        .fontWeight(.semibold)
                    
                    ForEach(0..<profileData.person.hobbies.count) { hobbie in
                        Text(profileData.person.hobbies[hobbie])
                    }
                }
                .padding(10)
                
                
                
                VStack {
                    Text("Cars")
                        .fontWeight(.semibold)
                        
                    Text(profileData.person.car.firstCar)
                    Text(profileData.person.car.secondCar)
                    Text(profileData.person.car.thirdCar)
                }
                .padding(10)
                
                
                
                VStack {
                    Text("Occupation")
                        .fontWeight(.semibold)
        
                    
                    Text(profileData.person.occupation)
                        
                }
                .padding(EdgeInsets(top: -40, leading: 0, bottom: 0, trailing: 0))
                
            }
            /// HStackView
            .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
                
            
            
                
                
            Spacer()
            
        }
        
    }
    
     func getProfileDataFromJSON() -> UserProfile  {
        
     let url = Bundle.main.url(forResource: "person", withExtension: "json")!
        
        do {
            let  data = try Data(contentsOf: url)
            return try JSONDecoder().decode(UserProfile.self, from: data)
            
        } catch {
            print(error)
        }
       return profile
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}


struct UserProfile: Codable {
    let person: Person
}

struct Person: Codable {
    let name: String
    let occupation: String
    let hobbies: [String]
    let car: Car
}

struct Car: Codable {
    let firstCar: String
    let secondCar: String
    let thirdCar: String
    
    enum CodingKeys: String, CodingKey {
        case firstCar = "first_car"
        case secondCar = "second_car"
        case thirdCar = "third_car"
    }
}




