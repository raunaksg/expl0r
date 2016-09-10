//
//  FourSqaureAPI.swift
//  Expl0r
//
//  Created by Raunak Gupta on 10/9/16.
//  Copyright © 2016 CMU. All rights reserved.
//

import Foundation
import QuadratTouch
import MapKit
import RealmSwift

struct API {
    struct notifications {
        static let venuesUpdated = "venues updated"
    }
}

struct VenueStruct {
    var id = ""
    var name = ""
    var latitude: Double = 0
    var longitude: Double = 0
}

class VenueAPI
{
    static let sharedInstance = VenueAPI()
    var session: Session?
    
    init()
    {
        /* set up client and start session */
        
        let client = Client(clientID: "TUCVW5DJVEFYNEWNOAKJ0PFPNNNI4SLHTPWO1U0YWDICCQO5", clientSecret: "BJLNMQTWLNHXGHW3MYDQD2O1VYEHK12TFMHD2YCHHDA0MMI0", redirectURL: "")
        let configuration = Configuration(client:client)
        Session.setupSharedSessionWithConfiguration(configuration)
        self.session = Session.sharedSession()

        
    }
    
//    func getChosenVenue(location: CLLocation, queryType: String) -> VenueStruct {
//        var chosenVenues = [VenueStruct]()
//        if let session = self.session {
//            var parameters = location.parameters()
//            parameters += [Parameter.query:queryType]
//            parameters += [Parameter.radius: "5000"]
//            parameters += [Parameter.limit: "20"]
//            
//            let searchTask = session.venues.search(parameters)
//            {
//                
//            }
//        }
//    }
}

extension CLLocation
{
    func parameters() -> Parameters
    {
        let ll      = "\(self.coordinate.latitude),\(self.coordinate.longitude)"
        let llAcc   = "\(self.horizontalAccuracy)"
        let alt     = "\(self.altitude)"
        let altAcc  = "\(self.verticalAccuracy)"
        let parameters = [
            Parameter.ll:ll,
            Parameter.llAcc:llAcc,
            Parameter.alt:alt,
            Parameter.altAcc:altAcc
        ]
        return parameters
    }
}



