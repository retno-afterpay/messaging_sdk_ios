// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskMessagingSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "ZendeskMessagingSDK",
            targets: [
              "ZendeskMessagingSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskMessagingAPISDK",
                 url: "https://github.com/retno-afterpay/messagingapi_sdk_ios",
                 .exact("3.8.4")),
        .package(name: "ZendeskCommonUISDK",
                 url: "https://github.com/retno-afterpay/commonui_sdk_ios",
                 .exact("6.1.3"))
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskMessagingSDK",
            path: "ZendeskMessagingSDK.xcframework"
        ),
        .target(name: "ZendeskMessagingSDKTargets",
                dependencies: [
                    .target(name: "ZendeskMessagingSDK"),
                    .product(name: "ZendeskMessagingAPISDK", package: "ZendeskMessagingAPISDK"),
                    .product(name: "ZendeskCommonUISDK", package: "ZendeskCommonUISDK")
                ],
                path: "Sources"
        )
    ]
)
