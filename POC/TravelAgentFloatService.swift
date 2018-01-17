//
//	TravelAgentFloatService.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class TravelAgentFloatService : NSObject, NSCoding{

	var intAgentFloatIO : IntAgentFloatIO!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let intAgentFloatIOData = dictionary["intAgentFloatIO"] as? [String:Any]{
			intAgentFloatIO = IntAgentFloatIO(fromDictionary: intAgentFloatIOData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if intAgentFloatIO != nil{
			dictionary["intAgentFloatIO"] = intAgentFloatIO.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         intAgentFloatIO = aDecoder.decodeObject(forKey: "intAgentFloatIO") as? IntAgentFloatIO

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if intAgentFloatIO != nil{
			aCoder.encode(intAgentFloatIO, forKey: "intAgentFloatIO")
		}

	}

}
