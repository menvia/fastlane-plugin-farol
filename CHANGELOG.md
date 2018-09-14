## 0.5.0 / 14.09.2018
##### Enhancements
- Update api method path from app to project
- Fix get version method that was not working because of api updates


## 0.4.5 / 03.07.2017

##### Fix
- Fix put method on farol_api to send out form data

## 0.4.4 / 02.07.2017

##### Fix
- Fix action farol_api changing form_data type to hash instead of string

## 0.4.3 / 02.07.2017

##### Fix
- Fix methods api call to check if the return is a valid JSON string

## 0.4.2 / 02.07.2017

##### Fix
- Fix methods api call to methods that have an empty return

## 0.4.1 / 02.07.2017

##### Fix
- Fix post method to only send form data if not nil

## 0.4.0 / 02.07.2017

##### Enhancement
- Add possibility to change Farol API URL using Environment Variable FAROL_URL (check examples at fastlane/Fastfile)

## 0.3.0 / 02.07.2017

##### Enhancement
- Add farol_api action for direct to Farol API
- Enhance farol action

## 0.2.0 / 29.05.2017

##### Enhancement
- Add actions farol_get_version and farol_set_version in order to control the version and build number from a Farol Target Version for a specific platform (android or ios)

## 0.1.0 / 02.05.2017

##### Enhancement
- First version, for test only
