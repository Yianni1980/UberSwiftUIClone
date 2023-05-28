//
//  SavedLocationViewModel.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 29/5/23.
//

import Foundation


enum savedLocationViewModel: Int,CaseIterable,Identifiable {
    case home
    case work
    
    var title:String {
        switch self {
        case .home: return "Home"
        case .work: return "Work"
        }
    }
    var imageName:String {
        switch self {
        case .home: return "house.circle.fill"
        case .work: return "archivebox.circle.fill"
        }
    }
    
    var subTitle:String {
        switch self {
        case .home: return "Add Home"
        case .work: return "Add Work"
        }
    }
    var id:Int {return self.rawValue}
}
