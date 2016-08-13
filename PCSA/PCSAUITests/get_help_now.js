
var target = UIATarget.localTarget();

target.frontMostApp().mainWindow().scrollViews()[0].buttons()["Get Help Now"].tap();
target.frontMostApp().mainWindow().textFields()[0].textFields()[0].tap();
target.frontMostApp().mainWindow().pickers()[0].wheels()[0].tapWithOptions({tapOffset:{x:0.52, y:0.63}, duration:1.3});
target.frontMostApp().mainWindow().buttons()["ArrowRight"].tap();
target.frontMostApp().mainWindow().buttons()["ArrowLeft"].tap();
target.tap({x:159.00, y:238.50});
target.frontMostApp().navigationBar().leftButton().tap();
