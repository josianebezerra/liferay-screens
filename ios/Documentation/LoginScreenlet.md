# LoginScreenlet for iOS

## Important Note

*This product is under heavy development and its features aren't ready for use in production. It's being made public only to allow developers to preview the technology.*

## Requirements

- XCode 6.0 or above
- iOS 8 SDK
- Liferay Portal 6.2 CE or EE

## Compatibility

- iOS 7 and above

## Features

The `LoginScreenlet` lets you authenticate portal users in your iOS app. The following authentication methods are supported:

- Email address
- Screen name
- User id

When user is successfully authenticated, their attributes are retrieved for use in the app. It's important to note that user credentials and attributes can be stored securely in the keychain. This information can then be used to perform automatic login in subsequent sessions.

## Module

- Auth

## Themes

- Default
- Flat7

![The `LoginScreenlet` using the Default and Flat7 themes.](Images/login.png)

## Portal Configuration

The authentication method should be configured in your Liferay instance. You can set this in the Control Panel by clicking *Portal Settings* and then *Authentication*.

![Setting the authentication method in Liferay Portal.](Images/portal-auth.png "Liferay portal authentication methods")

For more details, please refer to the [Configuring Portal Settings](https://www.liferay.com/documentation/liferay-portal/6.2/user-guide/-/ai/portal-settings-liferay-portal-6-2-user-guide-16-en) section of the User Guide.

## Attributes

| Attribute | Data type | Explanation |
|-----------|-----------|-------------| 
|  `saveCredentials` | `boolean` | When set, the user credentials and attributes are stored securely in the keychain. This information can then be loaded in subsequent sessions by calling the `SessionContext.loadSessionFromStore()` method. |
|  `companyId` | `number` | When set, authentication is done for a user in the specified company. If the value is `0`, the company specified in `LiferayServerContext` is used. |
|  `authMethod` | `string` | Specifies the authentication method to use. This must match the authentication method configured on the server. You can set this attribute to `email`, `screenName` or `userId`. |

## Delegate

The `LoginScreenlet` delegates some events to an object that conforms to the `LoginScreenletDelegate` protocol. This protocol lets you implement the following methods:

- `onLoginResponse(dictionary)`: Called when login successfully completes. The user attributes are passed as a dictionary of keys (`NSStrings`) and values (`NSObject`). The supported keys are the same as the [portal's User entity](https://github.com/liferay/liferay-portal/blob/6.2.x/portal-impl/src/com/liferay/portal/service.xml#L2227).
- `onLoginError(error)`: Called when an error occurs during login. The `NSError` object describes the error.
- `onCredentialsSaved`: Called when the user credentials are stored after a successful login.
- `onCredentialsLoaded`: Called when the user credentials are retrieved. Note that this only occurs when the screenlet is used and stored credentials are available.

