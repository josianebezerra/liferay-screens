/**
* Copyright (c) 2000-present Liferay, Inc. All rights reserved.
*
* This library is free software; you can redistribute it and/or modify it under
* the terms of the GNU Lesser General Public License as published by the Free
* Software Foundation; either version 2.1 of the License, or (at your option)
* any later version.
*
* This library is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
* FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
* details.
*/
import Foundation


public enum ScreenletsErrorCause: Int {

	case AbortedDueToPreconditions = -2
	case InvalidServerResponse = -3

}


internal func createError(#cause: ScreenletsErrorCause, userInfo: NSDictionary? = nil) -> NSError {
	return NSError(domain: "LiferayScreenlets", code: cause.rawValue, userInfo: userInfo)
}

internal func createError(#cause: ScreenletsErrorCause, #message: String) -> NSError {
	let userInfo = [NSLocalizedDescriptionKey: message]

	return NSError(domain: "LiferayScreenlets", code: cause.rawValue, userInfo: userInfo)
}


public func nullIfEmpty(string: String?) -> String? {
	if string == nil {
		return nil
	}
	else if string! == "" {
		return nil
	}

	return string
}

public func emptyIfNull(string: String?) -> String {
	if string == nil {
		return ""
	}

	return string!
}


func synchronized(lock:AnyObject, closure: Void -> Void) {
	objc_sync_enter(lock)
	closure()
	objc_sync_exit(lock)
}


func LocalizedString(tableName: String, key: String, obj: AnyObject) -> String {
	let bundle = NSBundle(forClass:obj.dynamicType)

	return NSLocalizedString(
				"\(tableName)-\(key)",
				tableName: tableName,
				bundle: bundle,
				value: "",
				comment: "")
}

