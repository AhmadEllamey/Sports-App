//
//  EventsDetails.swift
//  Sports-App
//
//  Created by Ahmad Ellamey on 5/17/22.
//  Copyright © 2022 Ahmad Ellamey & Marawan Adel. All rights reserved.
//

import Foundation

struct EventsDetails : Codable {
    let idEvent: String
    let idSoccerXML: String?
    let idAPIfootball, strEvent, strEventAlternate, strFilename: String
    let strSport, idLeague, strLeague, strSeason: String
    let strDescriptionEN, strHomeTeam, strAwayTeam, intHomeScore: String
    let intRound, intAwayScore: String
    let intSpectators: String?
    let strOfficial: String
    let strTimestamp: String
    let dateEvent, dateEventLocal, strTime, strTimeLocal: String
    let strTVStation: String?
    let idHomeTeam, idAwayTeam: String
    let intScore, intScoreVotes: String?
    let strResult, strVenue, strCountry, strCity: String
    let strPoster, strSquare: String
    let strFanart: String?
    let strThumb: String
    let strBanner: String
    let strMap: String?
    let strTweet1, strTweet2, strTweet3, strVideo: String
    let strStatus, strPostponed, strLocked: String
}

 
