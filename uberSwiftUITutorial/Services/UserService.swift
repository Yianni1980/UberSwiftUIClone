//
//  UserService.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 3/6/23.
//

import Foundation
import Firebase
class UserService:ObservableObject {
      static let shared = UserService()
    @Published var user:User?
 
    init() {
        print("DEBUG: Did init user service")
        fetchUser()
    }
    
     func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            print("DEBUG: Did fetcvh user from firestore")
            guard let snapshot = snapshot else {return}
            
            guard let user = try? snapshot.data(as: User.self) else {return}
            self.user = user
        }
    }
}
