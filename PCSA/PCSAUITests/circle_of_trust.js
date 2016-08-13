
var target = UIATarget.localTarget();
target.frontMostApp().mainWindow().scrollViews()[0].buttons()["Circle of Trust"].tap();
target.frontMostApp().navigationBar().rightButton().tap();
target.frontMostApp().mainWindow().scrollViews()[0].textFields()[0].textFields()[0].tap();
target.frontMostApp().keyboard().typeString("123456");
target.frontMostApp().mainWindow().scrollViews()[0].textFields()[1].textFields()[0].tap();
target.frontMostApp().keyboard().typeString("855963");
target.frontMostApp().windows()[1].toolbar().buttons()["Done"].tap();
target.frontMostApp().navigationBar().rightButton().tap();
target.frontMostApp().mainWindow().buttons()["HelpMeButton"].tap();
target.frontMostApp().alert().cancelButton().tap();

target.frontMostApp().navigationBar().leftButton().tap();
