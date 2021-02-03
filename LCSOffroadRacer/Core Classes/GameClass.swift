//
//  GameClass.swift
//  OffroadRacer
//
//  Created by LCS Game Design on 1/11/21.
//

import Foundation
import SpriteKit

class GameClass
{
    // variables
    var AICarList=[AICarClass]()
    
    var firstNameList=[String]()
    var lastNameList=[String]()
    var locationList=[String]()
    

    // constants


    
    func loadNameLists() -> String!
    {
        guard let filepath = Bundle.main.path(forResource: "RaceNames", ofType: "txt")
        else
        {
            print("Error opening file")
            return nil
        }
        
        let file:FileHandle?=FileHandle(forReadingAtPath: filepath)
        let data=file?.readDataToEndOfFile()
        
        file?.closeFile()
        
        let dataString=String(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        //print(dataString!)
        
        let lines = dataString!.split(separator: "\n")
        
        var lineNum:Int=0
        for line in lines
        {
            if line.prefix(1) != "#"
            {
            
                let columns = line.split(separator: ",")
                
                if(lineNum==0)
                {
                    for col in columns
                    {
                        locationList.append(String(col))
                    }
                } // if locations
                
                if (lineNum==1)
                {
                    for col in columns
                    {
                        lastNameList.append(String(col))
                    }
                }
                if(lineNum==2)
                {
                    for col in columns
                    {
                        firstNameList.append(String(col))
                    }
                }
                lineNum += 1
            } // if not a comment
        } // for each line
        

        
        
        
        return nil
            
    } // loadNameLists
    
    func generateName() -> String
    {
        var retName:String = ""
        let firstLastChance=random(min: 0, max: 1)
        
        // pick location
        let locSlot=Int(random(min: 0, max: CGFloat(locationList.count)))
        let locName=locationList[locSlot]
        
        
        if firstLastChance > 0.5
        {
            let firstSlot=Int(random(min: 0, max: CGFloat(firstNameList.count)))
            retName = "\(firstNameList[firstSlot]) \(locName)"
            
        }
        else
        {

            let lastSlot=Int(random(min: 0, max: CGFloat(lastNameList.count)))
            retName = "\(locName) \(lastNameList[lastSlot])"

        }
        
        return retName
    
    } // generateName
    
    init()
    {
        loadNameLists()
        print(generateName())
    }

}
