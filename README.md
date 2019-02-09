# TwilioSwift

This is a work in progress project. Only very specific features have been added as they are needed, and will be extended over time.

## Configuration

Import the package into your Swift project by including the package in your `Package.swift` file:

``` swift
.package(url: "https://github.com/iamjono/TwilioSwift.git", from: "0.0.1")
```

Obtain an Account SID and Authentication token from the Twilio console.

In your executable project, for example in your `main.swift`, set the SID and Authentication Token:

``` swift
import TwilioSwift

TwilioConfig.accountSid = "{yourSID}"
TwilioConfig.authToken = "{yourToken}"
```

## Current functionality

### Sending SMS

Once you have obtained a Twilio phone number, you can now send SMS messages:

``` swift
let t = Twilio.sendSMS(
	from: "+{twilio_issued_number}", 
	to: "+{country_code}{phone_number}", 
	message: "Hello, World!"
	)
// Output the success/fail message
print(t)
```

