//
//  HomeViewModel.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 1/6/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import Combine

class HomeViewModel:ObservableObject {
    @Published var drivers = [User]()
    private var cancellables = Set<AnyCancellable>()
    private let service = UserService.shared
    
    
    init() {
        
        fetchUser()
    }
    
    func fetchDrivers(){
        Firestore.firestore().collection("users").whereField("accountType", isEqualTo: AccountType.driver.rawValue)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let drivers =  documents.compactMap ({ try? $0.data(as:User.self) })
                self.drivers = drivers
            }
    }
    
    func fetchUser() {
        service.$user
        
            .sink { user in
                guard let user = user else {return}
                guard user.accountType == .passenger else {return}
                self.fetchDrivers()
            }
            .store(in: &cancellables)
    }
    
    
    
    
}
