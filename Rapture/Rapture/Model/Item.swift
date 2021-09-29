//
//  Item.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/29.
//

import SwiftUI

//Item/Intro model and sample items
struct Item: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}

//Onboarding Items
var items : [Item] = [

    Item(image: "Onboarding 1", title: "Create & edit posts.", description: "Have the need to share an epic gaming moment? With Rapture you can create and edit posts."),
    Item(image: "Onboarding 2", title: "Secure sign in & sign up.", description: "Worried about your information? Rapture securely stores your data on a seperate database."),
    Item(image: "Onboarding 3", title: "View others posts.", description: "You have to ability to view all other people's posts and be able to like their post as well.")
    
]
