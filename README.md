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

## Create the filter

```ruby
func initFilterViewController() {
filterTableViewController = FilterGenericTableViewController.init(style : UITableViewStyle.grouped)
filterTableViewController?.config = configParameters
filterTableViewController?.delegate = self
filterTableViewController?.title = "Filtres"
filterTableViewController?.theme = selectedElement.theme()


filterVC = UINavigationController.init(rootViewController: filterTableViewController!)
}
```

create an filter group

```ruby
self.configParameters = [
[.custom(type : FilterSelectionType.radio, values : self.recetteTimeValuesInitial, title : "temps de préparation")],
[.custom(type : FilterSelectionType.multi, values : self.recetteBudgetValuesInitial, title : "budget")],
[.custom(type : FilterSelectionType.radio, values : self.recetteDifficultyValuesInitial, title : "difficulté"),
.custom(type: .swwitch, values: [StaticSelectionableItem.init(text: "mode expert", output: "true", idFilter: "mode expert_selected", selected: true)], title:"" )],
[.validator]
]
```


## Author

sr-tune, boyer.rom1@gmail.com

## License

C4GenericFilter is available under the MIT license. See the LICENSE file for more info.
