# Pre-work - Tip Calculator

Tip-o-meter is a tip calculator application for iOS.

Submitted by: William Ho

Time spent: 14 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [ ] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Tip is automatically updated as the user types in/ changes the bill.
- [X] Settings page which allows persistence of changes

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://g.recordit.co/bqOWesN5JM.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Notes

Describe any challenges encountered while building the app.
- Learning how to use Xcode to create storyboards and linking storyboard objects to the Swift code
- Figuring out how to run code before a segue finishes. For example, when the user clicked the save button in the Settings page, the preferences would not be saved to UserDefaults before going back to the main view. I solved this problem by overriding the prepare() function.
- Understanding how optionals work in Swift
- Creating references between objects/actions and functions (e.g., updating the total amount when user changes the bill amount)
- Determining when 10 minutes had passed since the last time a bill was entered (I just had to use one of the built-in functions to get the current time, store it, and the next time the view appeared, check if the current time - previous time was greater than 600 seconds)
- Hiding the currency picker and displaying it when the user clicks on the label to update the currency.


## License

    Copyright 2022 William Ho

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
