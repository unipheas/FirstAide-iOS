
var target = UIATarget.localTarget();
target.dragFromToForDuration({x:19.00, y:294.00}, {x:87.50, y:513.00}, 3.9);
target.dragFromToForDuration({x:19.00, y:294.00}, {x:314.50, y:513.00}, 5.2);
target.frontMostApp().mainWindow().textFields()[0].textFields()[0].scrollToVisible();
