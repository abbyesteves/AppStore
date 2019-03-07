//
//  Models.swift
//  AppStore
//
//  Created by Abby Esteves on 18/02/2019.
//  Copyright © 2019 Abby Esteves. All rights reserved.
//

import UIKit

// game of the day
// advertisments
// app of the day
// the daily list
// the list



//struct Controllers : Decodable {
//    var title : String?
//    var icon : String?
//    var controller : UIViewController?
//}

class Data {
    func controllers() -> [[String:Any]] {
        return [[
            "title": "home",
            "icon": "",
            "numbers" : 0,
            "controller": HomeController()
        ],[
            "title": "Games",
            "icon": "",
            "numbers" : 11,
            "controller": GamesController()
        ],[
            "title": "Apps",
            "icon": "",
            "numbers" : 1,
            "controller": AppsController()//AppsController
        ],[
            "title": "Updates",
            "icon": "",
            "numbers" : 5,
            "controller": UpdatesController()//UpdatesController
        ],[
            "title": "Search",
            "icon": "",
            "numbers" : 8,
            "controller": SearchController()//SearchController
        ]]
    }
}
