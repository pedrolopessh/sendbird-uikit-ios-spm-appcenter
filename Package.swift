// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SendbirdUIKit",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "SendbirdUIKit",
            targets: ["SendbirdUIKitTarget"]
        ),
    ],
    dependencies: [
        .package(
			name: "SendbirdChatSDK",
            url: "https://github.com/pedrolopessh/sendbird-chat-sdk-ios-appcenter",
			.branch("master")
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SendbirdUIKit",
			path: "./Sources/SendbirdUIKit.xcframework"
        ),
        .target(
            name: "SendbirdUIKitTarget",
            dependencies: [
                .target(name: "SendbirdUIKit"),
                .product(name: "SendbirdChatSDK", package: "SendbirdChatSDK")
            ],
            path: "Sources"
        ),
    ]
)
