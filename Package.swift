// swift-tools-version:4.0
// Generated automatically by Perfect Assistant
// Date: 2019-02-09 19:05:07 +0000
import PackageDescription

let package = Package(
	name: "TwilioSwift",
	products: [
		.library(name: "TwilioSwift", targets: ["TwilioSwift"])
	],
	dependencies: [
		.package(url: "https://github.com/PerfectlySoft/Perfect-CURL.git", "3.0.0"..<"4.0.0")
	],
	targets: [
		.target(name: "TwilioSwift", dependencies: ["PerfectCURL"]),
//		.target(name: "TwilioSwiftTests", dependencies: ["TwilioSwift"])
	]
)
