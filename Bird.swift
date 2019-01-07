//
//  Bird.swift
//  CNPGuide
//
//  Created by Mike Yakubovsky on 10/14/18.
//  Copyright © 2018 Mike Yakubovsky. All rights reserved.
//

import UIKit
import os.log

class Bird: NSObject, NSCoding {
    // MARK: - Properties
    
    var birdName: String
    var birdDescription: String?
    var sighted: Bool
    var mainPhoto: UIImage?
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory,
                                                       in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("birds")
    
    // MARK: - Types
    struct PropertyKey {
        static let birdName = "birdName"
        static let birdDescription = "birdDescription"
        static let sighted = "sighted"
        static let mainPhoto = "mainPhoto"
    }
    
    // MARK: - Initialization
    init?(birdName: String,
          birdDescription: String?,
          sighted: Bool,
          mainPhoto: UIImage?) {
        
        if birdName.isEmpty {
            return nil
        }
        
        self.birdName = birdName
        self.birdDescription = birdDescription
        self.sighted = sighted
        self.mainPhoto = mainPhoto
    }
    
    // MARK: - NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(birdName, forKey: PropertyKey.birdName)
        aCoder.encode(birdDescription, forKey: PropertyKey.birdDescription)
        aCoder.encode(sighted, forKey: PropertyKey.sighted)
        aCoder.encode(mainPhoto, forKey: PropertyKey.mainPhoto)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let birdName = aDecoder.decodeObject(forKey: PropertyKey.birdName) as? String else {
            os_log("Unable to decode the name for a Bird object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let birdDescription = aDecoder.decodeObject(forKey: PropertyKey.birdDescription) as? String else {
            os_log("Unable to decode the description for a Bird object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let sighted = aDecoder.decodeBool(forKey: PropertyKey.sighted) as? Bool else {
            os_log("Unable to decode the sighting for a Bird object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let mainPhoto = aDecoder.decodeObject(forKey: PropertyKey.mainPhoto) as? UIImage else {
            os_log("Unable to decode the photo for a Bird object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(birdName: birdName, birdDescription: birdDescription, sighted: sighted, mainPhoto: mainPhoto)
    }
}
