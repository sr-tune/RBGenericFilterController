# C4GenericFilter

[![CI Status](http://img.shields.io/travis/sr-tune/C4GenericFilter.svg?style=flat)](https://travis-ci.org/sr-tune/C4GenericFilter)
[![Version](https://img.shields.io/cocoapods/v/C4GenericFilter.svg?style=flat)](http://cocoapods.org/pods/C4GenericFilter)
[![License](https://img.shields.io/cocoapods/l/C4GenericFilter.svg?style=flat)](http://cocoapods.org/pods/C4GenericFilter)
[![Platform](https://img.shields.io/cocoapods/p/C4GenericFilter.svg?style=flat)](http://cocoapods.org/pods/C4GenericFilter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements



## Installation

C4GenericFilter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "C4GenericFilter"
```

## implement delegates method in your viewController that show the filter

```ruby
extension ViewController : FilterGenericTableViewDelegate {

func filterAdded(_ filterParams : NSDictionary) {
print(filterParams)
}
}
```

## Create a filterViewController

Note that filter should be embedded in navigation controller to enable cancel action on filter (dismiss)

```ruby
func initFilterViewController() {
filterTableViewController = FilterGenericTableViewController.init(style : UITableViewStyle.grouped)
filterTableViewController?.config = configParameters
filterTableViewController?.delegate = self

filterVC = UINavigationController.init(rootViewController: filterTableViewController!)

navigationController?.present(filterVC, animated: true, completion: nil)

}
```

create a filter group

```ruby
var recetteTimeValuesInitial  = [StaticSelectionableItem.init(text : "⏱", output : "1", idFilter: "timer", selected: false),
StaticSelectionableItem.init(text : "⏱⏱", output : "2", idFilter: "timer", selected: true),
StaticSelectionableItem.init(text : "⏱⏱⏱", output : "3", idFilter: "timer", selected: false)
]
```


add filter group in filter configuration

```ruby
self.configParameters = [
[.custom(type : FilterSelectionType.radio, values : self.recetteTimeValuesInitial, title : "temps de préparation")],
[.validator]
]
```

Don't forget to put '[.validator]' filter group at the end of filter to enable filter actions

## Author

sr-tune, boyer.rom1@gmail.com

## License

C4GenericFilter is available under the MIT license. See the LICENSE file for more info.
