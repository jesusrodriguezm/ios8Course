//
//  FeedItem.swift
//  ExchangeAGram
//
//  Created by Jesús on 24/12/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import Foundation
import CoreData

@objc (FeedItem)
class FeedItem: NSManagedObject {

    @NSManaged var caption: String
    @NSManaged var image: NSData

}
