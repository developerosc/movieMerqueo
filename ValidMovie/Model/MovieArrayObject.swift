//
//  MovieArrayObject.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 30/07/19.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//
import Foundation
import UIKit

class MovieArrayObject: NSObject {
    
    var adult = ""
    var backdrop_path = ""
    var belongs_to_collection = ""
    var budget = ""
    var genres = ""
    var homepage = ""
    var id = ""
    var imdb_id = ""
    var original_language = ""
    var original_title = ""
    var overview = ""
    var popularity = ""
    var poster_path = ""
    var production_companies = ""
    var production_countries = ""
    var release_date = ""
    var revenue = ""
    var runtime = ""
    var spoken_languages = ""
    var status = ""
    var tagline = ""
    var title = ""
    var video = ""
    var vote_average = ""
    var vote_count = ""
  
    
    
    
    init (dic:NSDictionary)
    {
        adult = ValueJsonString(dic: dic, key: "adult")
        backdrop_path = ValueJsonString(dic: dic, key: "backdrop_path")
        belongs_to_collection = ValueJsonString(dic: dic, key: "belongs_to_collection")
        budget = ValueJsonString(dic: dic, key: "budget")
        genres = ValueJsonString(dic: dic, key: "genres")
        homepage = ValueJsonString(dic: dic, key: "homepage")
        id = ValueJsonString(dic: dic, key: "id")
        imdb_id = ValueJsonString(dic: dic, key: "imdb_id")
        original_language = ValueJsonString(dic: dic, key: "original_language")
        original_title = ValueJsonString(dic: dic, key: "original_title")
        overview = ValueJsonString(dic: dic, key: "overview")
        popularity = ValueJsonString(dic: dic, key: "popularity")
        poster_path = ValueJsonString(dic: dic, key: "poster_path")
        production_companies = ValueJsonString(dic: dic, key: "production_companies")
        release_date = ValueJsonString(dic: dic, key: "release_date")
        revenue = ValueJsonString(dic: dic, key: "revenue")
        spoken_languages = ValueJsonString(dic: dic, key: "spoken_languages")
        status = ValueJsonString(dic: dic, key: "status")
        tagline = ValueJsonString(dic: dic, key: "tagline")
        title = ValueJsonString(dic: dic, key: "title")
        video = ValueJsonString(dic: dic, key: "video")
        vote_average = ValueJsonString(dic: dic, key: "vote_average")
        vote_count = ValueJsonString(dic: dic, key: "vote_count")
        
        
        
    }
    
}
