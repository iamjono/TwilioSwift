//
//  Twilio.swift
//  https://www.twilio.com/docs/sms/send-messages?code-sample=code-send-an-sms-message&code-language=curl&code-sdk-version=json
//
//  Created by Jonathan Guthrie on 2019-02-08.
//

import Foundation
import PerfectCURL

public struct TwilioConfig {
	public static let api: String = "https://api.twilio.com/2010-04-01/Accounts/"
	public static var accountSid: String = ""
	public static var authToken: String = ""
}

public enum TwilioStatus {
	case Success, Fail(String)
}

public class Twilio {
	public static func sendSMS(from: String, to: String, message: String) -> TwilioStatus {
		// Ensure the
		guard !TwilioConfig.accountSid.isEmpty else {
			return TwilioStatus.Fail("Account ID must be present")
		}

		// do perfect curl version first. then curly
		let curlObject = CURLRequest("\(TwilioConfig.api)\(TwilioConfig.accountSid)/Messages.json", options: [CURLRequest.Option.httpMethod(.post)])

		curlObject.addHeader(.cacheControl, value: "no-cache")
		curlObject.addHeader(.userAgent, value: "PerfectRequest1.0")

		curlObject.options.append(CURLRequest.Option.userPwd("\(TwilioConfig.accountSid):\(TwilioConfig.authToken)"))

		curlObject.options.append(CURLRequest.Option.postField(.init(name: "Body", value: message)))
		curlObject.options.append(CURLRequest.Option.postField(.init(name: "To", value: to)))
		curlObject.options.append(CURLRequest.Option.postField(.init(name: "From", value: from)))

		do {
			let response = try curlObject.perform()
			if response.responseCode >= 400 {
				// something went wrong, reporting it
				return TwilioStatus.Fail("\(response.bodyString)")
			}
			// success
//			print(response.bodyJSON)
			return TwilioStatus.Success

		} catch {
			return TwilioStatus.Fail("\(error)")
		}

	}
}
