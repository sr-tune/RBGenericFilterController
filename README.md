# C4GenericFilter

[![CI Status](http://img.shields.io/travis/sr-tune/C4GenericFilter.svg?style=flat)](https://travis-ci.org/sr-tune/C4GenericFilter)
[![Version](https://img.shields.io/cocoapods/v/C4GenericFilter.svg?style=flat)](http://cocoapods.org/pods/C4GenericFilter)
[![License](https://img.shields.io/cocoapods/l/C4GenericFilter.svg?style=flat)](http://cocoapods.org/pods/C4GenericFilter)
[![Platform](https://img.shields.io/cocoapods/p/C4GenericFilter.svg?style=flat)](http://cocoapods.org/pods/C4GenericFilter)

![Alt text](https://user-images.githubusercontent.com/1142694/29366641-d881d1dc-829a-11e7-986b-7e35046f24e5.png?raw=true "Filter in action")

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements



## Installation

C4GenericFilter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "C4GenericFilter"
```

## Implements delegate's method in your viewController to get user's selection 

```swift
extension ViewController : FilterGenericTableViewDelegate {

func filterAdded(_ filterParams : NSDictionary) {
print(filterParams)
}
}
```

## Create a filter group, you can tell if item is autoselected or not, you can put an image instead of a text by selecting method with "image" parameter enable.



```swift
StaticSelectionableItem.init(image: <#T##UIImage?#>, text: <#T##String#>, output: <#T##String#>, idFilter: <#T##String#>, selected: <#T##Bool#>)


var recetteTimeValuesInitial  = [
StaticSelectionableItem.init(text : "⏱", output : "1", idFilter: "timer", selected: false),
StaticSelectionableItem.init(text : "⏱⏱", output : "2", idFilter: "timer", selected: true),
StaticSelectionableItem.init(text : "⏱⏱⏱", output : "3", idFilter: "timer", selected: false)
]
```

## add filter group in your filter configuration

```swift
self.configParameters = [
[.custom(type : FilterSelectionType.radio, values : self.recetteTimeValuesInitial, title : "temps de préparation")],
[.validator]
]
```
FilterSelection enum will guide you in wich kind of filter do you want in your filter group (radio buttons, multiselection, or boolean selection)

## Create a filterViewController and set the config property and delegate

Note that the filter should be embedded in navigation controller to enable cancel action on filter (dismiss)

```swift
func initFilterViewController() {
filterTableViewController = FilterGenericTableViewController.init(style : UITableViewStyle.grouped)
filterTableViewController?.config = configParameters
filterTableViewController?.delegate = self

filterVC = UINavigationController.init(rootViewController: filterTableViewController!)

navigationController?.present(filterVC, animated: true, completion: nil)

}
```

Don't forget to put '[.validator]' filter group at the end of filter to enable filter actions. // Next improvment


## Output of the filter is a dictionary


user selection :
![Alt text](https://user-images.githubusercontent.com/1142694/29367963-b6f4fcd4-829e-11e7-81c5-299a1a8fb5c3.png?raw=true "Filter in action")


output after click on "Filtrer" button
```swift
{
"banque_selected" = 1;
budget =     (
1
);
difficulty =     (
2,
3
);
"drive_selected" = 0;
}
```

## Author

sr-tune, boyer.rom1@gmail.com

## License

C4GenericFilter is available under the MIT license. See the LICENSE file for more info.
