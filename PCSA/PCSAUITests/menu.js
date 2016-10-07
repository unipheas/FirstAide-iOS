
var target = UIATarget.localTarget();

target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT);
target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().mainWindow().tableViews()[0].dragInsideWithOptions({startOffset:{x:0.22, y:0.01}, endOffset:{x:0.22, y:0.79}, duration:2.1});
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.18, y:0.28}});
target.frontMostApp().mainWindow().tableViews()[0].dragInsideWithOptions({startOffset:{x:0.22, y:0.67}, endOffset:{x:0.26, y:0.55}, duration:1.7});
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.23, y:0.13}});
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.18, y:0.39}});
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.20, y:0.40}});
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.19, y:0.53}});
target.frontMostApp().mainWindow().tableViews()[0].cells()["Impact of Sexual Assault"].scrollToVisible();
target.frontMostApp().mainWindow().tableViews()[0].cells()["Sexual Assault Common Questions"].scrollToVisible();
target.frontMostApp().mainWindow().tableViews()[0].cells()["Sexual Assualt Awareness"].tap();
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.19, y:0.61}});
target.frontMostApp().mainWindow().tableViews()[0].dragInsideWithOptions({startOffset:{x:0.20, y:0.42}, endOffset:{x:0.21, y:0.66}});
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.19, y:0.54}});
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.19, y:0.54}});
target.frontMostApp().navigationBar().leftButton().tap();

target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().mainWindow().images()["LogoPrimary"].tapWithOptions({tapOffset:{x:0.01, y:0.28}});
target.frontMostApp().mainWindow().scrollViews()[0].dragInsideWithOptions({startOffset:{x:-0.79, y:0.37}, endOffset:{x:0.03, y:0.39}, duration:1.0});
target.frontMostApp().mainWindow().tableViews()[0].dragInsideWithOptions({startOffset:{x:0.66, y:0.31}, endOffset:{x:0.13, y:0.31}});
