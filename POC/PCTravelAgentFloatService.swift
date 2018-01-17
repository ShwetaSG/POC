//
//	PCTravelAgentFloatService.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct PCTravelAgentFloatService{

	var intAgentFloatIO : PCIntAgentFloatIO!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let intAgentFloatIOData = dictionary["intAgentFloatIO"] as? [String:Any]{
				intAgentFloatIO = PCIntAgentFloatIO(fromDictionary: intAgentFloatIOData)
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

}