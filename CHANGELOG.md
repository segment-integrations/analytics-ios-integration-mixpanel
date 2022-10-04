Change Log
==========

Version 1.7.3 *(4th October, 2022)*
-------------------------------------------
* Bumps Mixpanel dependency from 3.9.0 to 5.0.0

Version 1.7.2 *(21st June, 2021)*
-------------------------------------------
* Bumps Mixpanel dependency from 3.7.1 to 3.9.0.

Version 1.7.1 *(3rd May, 2021)*
-------------------------------------------
* Bumped Mixpanel dependency from 3.5 to 3.7.1.

Version 1.7.0 *(7th October, 2020)*
-------------------------------------------
* Updates import headers for iOS 14 support.

Version 1.6.0 *(9th January, 2019)*
-------------------------------------------
    * [New] Add support for enabling Segment to send data to Mixpanel's EU endpoint leveraging a new setting. M.panel EU Endpoint documentation can be found [here](https://developer.mixpanel.com/docs/implement-mixpanel#section-implementing-mixpanel-in-the-european-union-eu).

Version 1.5.0 *(9th January, 2019)*
-------------------------------------------
*(Upgrade Segment-Mixpanel to 3.5)*

    * [New](https://github.com/segment-integrations/analytics-ios-integration-mixpanel/pull/47): Upgrade Segment-Mixpanel to 3.5.0.

    * [New] Add support for groups

Version 1.4.0 *(12th September, 2019)*
-------------------------------------------
*(Upgrade Segment-Mixpanel to 3.4.7)*

    * [New](https://github.com/segment-integrations/analytics-ios-integration-mixpanel/pull/42): Upgrade Segment-Mixpanel to 3.4.7.

Version 1.3.0 *(21st March, 2018)*
-------------------------------------------
*(Supports analytics-ios 3.0+ and Mixpanel 3.0+)*

    * [New](https://github.com/segment-integrations/analytics-ios-integration-mixpanel/pull/38): Supports automatic property increments for user profiles.

Version 1.2.0 *(20th February, 2017)*
-------------------------------------------
*(Supports analytics-ios 3.0+ and Mixpanel 3.0+)*

    * Adds instance with launch-options for Mixpanel Push Notification Tracking.
    * Updates Example/Podfile to [Cocoapods 1.0 spec.](http://blog.cocoapods.org/CocoaPods-1.0-Migration-Guide/)

Version 1.1.0 *(12th July, 2016)*
-------------------------------------------
*(Supports analytics-ios 3.0+ and Mixpanel 3.0+)*

    * Supports any version greater than 3.0 and less than 4.0.
    * Fixes small bug in the Mixpanel library in version 2.9.9, for the in-app notifications, that was fixed in the version 3.0
    * Drops iOS 7 support


Version 1.0.5 *(7th July, 2016)*
-------------------------------------------
*(Supports analytics-ios 3.0)*

    * Supports any version greater than 3.0 and less than 4.0.

Version 1.0.4 *(12th May, 2016)*
-------------------------------------------
*(Supports analytics-ios 3.0.+ and Mixpanel 2.9.+)*

  * Support Segment's consolidatedPageCalls setting to send `Loaded a Screen` for all Screen events.

Version 1.0.3 *(27th January, 2016)*
-------------------------------------------
*(Supports analytics-ios 3.0.+ and Mixpanel 2.9.+)*

  * Return `instancetype` in factory instead of generic `id`.


Version 1.0.2 *(24th November, 2015)*
-------------------------------------------
*(Supports analytics-ios 3.0.+ and Mixpanel 2.9.+)*

  * Update `registerForRemoteNotificationsWithDeviceToken` to `registeredForRemoteNotificationsWithDeviceToken`.


Version 1.0.1 *(24th November, 2015)*
-------------------------------------------
*(Supports analytics-ios 3.0.+ and Mixpanel 2.9.+)*

  * Depend on stable version of analytics-ios.


Version 1.0.0 *(18th November, 2015)*
-------------------------------------------
*(Supports analytics-ios 3.0.+ and Mixpanel 2.9.+)*

Initial stable release.


Version 1.0.0-alpha *(18th November, 2015)*
-------------------------------------------
*(Supports analytics-ios 3.0.+ and Mixpanel 2.9.+)*

Initial alpha release.
